import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gopraying/model/app_user.dart';
import 'package:gopraying/model/category.dart';
import 'package:gopraying/model/prayer.dart';
import 'package:gopraying/model/server_response.dart';
import 'package:gopraying/page_transition/push_replace.dart';
import 'package:gopraying/provider/bottom_menu_provider.dart';
import 'package:gopraying/provider/user_provider.dart';
import 'package:gopraying/repository/prayer_repo.dart';
import 'package:gopraying/ui/dashboard/dashboard.dart';
import 'package:gopraying/ui/dashboard/publish/alert_dialog/select_category_alert.dart';
import 'package:gopraying/ui/widgets/add_image_widget.dart';
import 'package:gopraying/ui/widgets/choose_image_from.dart';
import 'package:gopraying/ui/widgets/delete_icon.dart';
import 'package:gopraying/ui/widgets/image_preview.dart';
import 'package:gopraying/utils/alert_utils.dart';
import 'package:gopraying/utils/colors.dart';
import 'package:gopraying/utils/utilities.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddPrayer extends StatefulWidget {
  final Prayer prayer;
  bool isEditing;

  AddPrayer({this.prayer, this.isEditing = false});
  @override
  _AddPrayerState createState() => _AddPrayerState();
}

class _AddPrayerState extends State<AddPrayer> {
  var titleFieldController = TextEditingController();
  var titleFieldFocus = FocusNode();
  var descFieldController = TextEditingController(text: '');
  var descFieldFocus = FocusNode();

  AppUser _appUser;
  Prayer _prayer;
  Category _category;
  bool isWriting = false;
  String _imageUrl = '';

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  _initialize() async {
    _appUser = Provider.of<UserProvider>(context, listen: false).getUser;
    if (!widget.isEditing) {
      String pId = 'gp' + Utilities.genRandString(length: 8).toUpperCase();
      _prayer = Prayer(
        prayerId: pId,
        prayerDescription: '',
        userName: _appUser.userId.toString(),
      );
    } else {
      _prayer = widget.prayer;
      _category = Category(categoryId: 0, categoryName: _prayer.prayerCategory);
      titleFieldController.text = _prayer.prayerTitle;
      descFieldController.text = (_prayer.prayerDescription.isNotEmpty) ? _prayer.prayerDescription : '';
      if (!_prayer.isImgEmpty()) {
        _imageUrl = _prayer.prayerFilePath;
      }
      setState(() {});
    }
  }

  void selectImage(ImageSource source) async {
    AlertUtils.showProgressDialog(context, title: null);
    var pickedImage = await Utilities.pickImage(source: source);
    AlertUtils.hideProgressDialog(context);

    if (pickedImage != null) {
      String _imagePath = pickedImage.path;
      setState(() => _imageUrl = _imagePath);
    } else {
      AlertUtils.toast('No image selected.');
    }
  }

  _hideKeyboard() {
    titleFieldFocus.unfocus();
    descFieldFocus.unfocus();
  }

  _publish() async {
    _hideKeyboard();
    String prayerTitle = titleFieldController.text.trim();
    String prayerDesc = descFieldController.text.trim();

    if (prayerTitle.isEmpty) {
      AlertUtils.toast('Prayer title is required');
    } else if (_category == null) {
      AlertUtils.toast('Select prayer category');
    } else {
      if (_imageUrl.isNotEmpty && Utilities.isImgLocal(_imageUrl)) {
        File tmpFile = File(_imageUrl);
        String base64Image = base64Encode(tmpFile.readAsBytesSync());
        _prayer.prayerFilePath = base64Image;
      } else {
        _prayer.prayerFilePath = '';
      }

      _prayer.prayerTitle = prayerTitle;
      _prayer.prayerDescription = prayerDesc;
      _prayer.prayerCategory = _category.categoryId.toString();
      _prayer.timestamp = DateTime.now().microsecondsSinceEpoch;
      _prayer.userName = "";
      AlertUtils.showProgressDialog(context, title: null);
      ServerResponse serverResponse = await PrayerRepo.postPrayer(prayer: _prayer);
      AlertUtils.hideProgressDialog(context);

      if (serverResponse.success) {
        AlertUtils.showCustomDialog(context, body: serverResponse.message);
        await _updatePrayer();
        Timer(Duration(seconds: 2), () => _navigate());
      } else {
        AlertUtils.showCustomDialog(context, body: serverResponse.message);
      }
    }
  }

  _updatePrayer() async {
    Prayer updatedPrayer = await PrayerRepo.getPrayer(userId: _appUser.userId, prayerId: _prayer.prayerId);
    if (updatedPrayer != null) {
      widget.prayer.update(updatedPrayer);
    }
  }

  _navigate() {
    Navigator.pop(context); //REMOVE THE POP DIALOG
    if (widget.isEditing) {
      Navigator.pop(context);
    } else {
      Provider.of<BottomMenuProvider>(context, listen: false).onChangeMenu(1);
      Push.pushAndRemoveUntil(context, page: Dashboard());
    }
  }

  _categoryDialog() {
    _hideKeyboard();
    if (widget.isEditing) return;
    showDialog(
      context: context,
      builder: (_) => SelectCategoryAlert(
        category: _category,
        onSelect: (cat) => setState(() => _category = cat),
      ),
    );
  }

  _showFileChooser() {
    _hideKeyboard();
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return ChooseImageFrom(
          imageSource: (source) => selectImage(source),
        );
      },
    );
  }

  _deleteImage() {
    if (_imageUrl.isNotEmpty) {
      AlertUtils.confirm('Remove Image?', context: context, okCallBack: () async {
        if (!Utilities.isImgLocal(_imageUrl)) {
          AlertUtils.showProgressDialog(context, title: null);
          var deleteImg = await PrayerRepo.deleteImage(prayerId: _prayer.prayerId);
          AlertUtils.hideProgressDialog(context);

          if (deleteImg.success) {
            _updatePrayer();
            setState(() => _imageUrl = '');
          } else {
            AlertUtils.showCustomDialog(context, body: deleteImg.message);
          }
        } else {
          setState(() => _imageUrl = '');
        }
      });
    }
  }

  //DELETE PRAYER
  _delete() {
    AlertUtils.confirm('Delete this prayer request permanently?', context: context, okCallBack: () async {
      if (widget.isEditing) {
        AlertUtils.showProgressDialog(context, title: null);
        ServerResponse deletePrayer = await PrayerRepo.deletePrayer(prayerId: _prayer.prayerId);
        AlertUtils.hideProgressDialog(context);
        if (deletePrayer.success) {
          AlertUtils.showCustomDialog(context, body: deletePrayer.message);
          widget.isEditing = false;
          Timer(Duration(seconds: 2), () => _navigate());
        } else {
          AlertUtils.showCustomDialog(context, body: deletePrayer.message);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.white70,
        leading: IconButton(
          icon: Icon(Icons.close, size: 32, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          if (isWriting || widget.isEditing)
            InkWell(
              onTap: _publish,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(right: 16),
                child: Text(
                  (widget.isEditing) ? 'EDIT PRAYER' : 'ADD PRAYER',
                  style: TextStyle(color: kColorDarkBlue, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ],
      ),
      body: Container(
        height: double.infinity,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: [
            TextField(
              controller: titleFieldController,
              focusNode: titleFieldFocus,
              keyboardType: TextInputType.multiline,
              onChanged: (val) {
                if (val.length > 0 && val.trim() != "" && !isWriting)
                  setState(() => isWriting = true);
                else if (val.trim() == "" && isWriting) setState(() => isWriting = false);
              },
              maxLines: null,
              cursorHeight: 30,
              cursorColor: kColorDarkBlue.withOpacity(.8),
              style: TextStyle(color: kColorDarkBlue, fontSize: 20),
              decoration: InputDecoration(
                hintText: "Prayer Title...",
                hintStyle: TextStyle(color: kColorDarkBlue.withOpacity(.8), fontSize: 20, fontStyle: FontStyle.italic),
                border: OutlineInputBorder(borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.transparent,
              ),
            ),
            Divider(color: Colors.black12),
            Text(
              '   DESCRIPTION',
              style: TextStyle(color: Colors.black45),
            ),
            TextField(
              controller: descFieldController,
              focusNode: descFieldFocus,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              cursorHeight: 20,
              cursorColor: kColorDarkBlue.withOpacity(.8),
              style: TextStyle(color: kColorDarkBlue, fontSize: 16),
              decoration: InputDecoration(
                hintText: "Add a description to this prayer... even use tags like #family #missionaries",
                hintStyle: TextStyle(color: kColorDarkBlue.withOpacity(.8), fontSize: 16, fontStyle: FontStyle.italic),
                hintMaxLines: 3,
                border: OutlineInputBorder(borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.transparent,
              ),
            ),
            Divider(color: Colors.black12),
            ListTile(
              onTap: _categoryDialog,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              title: Text(
                'SELECT CATEGORY',
                style: TextStyle(color: Colors.black45, fontSize: 14),
              ),
              subtitle: (_category == null)
                  ? null
                  : Text(
                      _category.categoryName,
                      style: TextStyle(color: kColorDarkBlue, fontSize: 18),
                    ),
              trailing: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.black45,
              ),
            ),
            Divider(color: Colors.black12),
            SizedBox(height: 16),
            if (_imageUrl.isEmpty)
              AddImageWidget(
                onClick: _showFileChooser,
              ),
            SizedBox(height: 2),
            if (_imageUrl.isNotEmpty)
              ImagePreview(
                imgUrl: _imageUrl,
                onDelClick: _deleteImage,
              ),
            SizedBox(height: 16),
            DeleteIcon(onClick: _delete),
          ],
        ),
      ),
    );
  }
}
