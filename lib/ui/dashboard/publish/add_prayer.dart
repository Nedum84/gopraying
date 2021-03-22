import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gopraying/utils/colors.dart';

class AddPrayer extends StatefulWidget {
  @override
  _AddPrayerState createState() => _AddPrayerState();
}

class _AddPrayerState extends State<AddPrayer> {
  var titleFieldController = TextEditingController();
  var titleFieldFocus = FocusNode();
  var descFieldController = TextEditingController();
  var descFieldFocus = FocusNode();

  bool isWriting = false;

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
          if (isWriting)
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: 16),
              child: Text(
                'ADD PRAYER',
                style: TextStyle(color: kColorDarkBlue, fontSize: 16, fontWeight: FontWeight.bold),
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
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              title: Text(
                'SELECT CATEGORY',
                style: TextStyle(color: Colors.black45, fontSize: 14),
              ),
              subtitle: Text(
                'Family',
                style: TextStyle(color: kColorDarkBlue, fontSize: 18),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.black45,
              ),
            ),
            Divider(color: Colors.black12),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 150,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: kColorPrimary.withOpacity(.7), width: 1),
                ),
                child: Row(
                  children: [
                    Icon(Icons.add_circle_outlined),
                    Text(' ADD A PHOTO'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/gradient_bg.png',
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.5),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: kColorPrimary.withOpacity(.3), width: 1),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.clear,
                            color: Colors.white,
                            size: 12,
                          ),
                          Text(' remove')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
