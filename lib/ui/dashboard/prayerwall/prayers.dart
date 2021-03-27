import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gopraying/model/app_user.dart';
import 'package:gopraying/model/prayer.dart';
import 'package:gopraying/model/server_response.dart';
import 'package:gopraying/provider/prayer_provider.dart';
import 'package:gopraying/provider/user_provider.dart';
import 'package:gopraying/repository/prayer_repo.dart';
import 'package:gopraying/ui/dashboard/prayerwall/prayer_detail.dart';
import 'package:gopraying/ui/widgets/global_styles.dart';
import 'package:gopraying/ui/widgets/image_file_icon.dart';
import 'package:gopraying/ui/widgets/no_data_found.dart';
import 'package:gopraying/ui/widgets/view_image.dart';
import 'package:gopraying/utils/alert_utils.dart';
import 'package:gopraying/utils/colors.dart';
import 'package:gopraying/utils/utilities.dart';
import 'package:provider/provider.dart';

class Prayers extends StatefulWidget {
  @override
  _PrayersState createState() => _PrayersState();
}

class _PrayersState extends State<Prayers> {
  AppUser _user;

  @override
  void initState() {
    super.initState();
    _user = Provider.of<UserProvider>(context, listen: false).getUser;
    Provider.of<PrayerProvider>(context, listen: false).updatePrayer(userId: _user.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PrayerProvider>(
      builder: (context, prayerProvider, child) {
        if (prayerProvider.isLoading && prayerProvider.prayers.isEmpty)
          return Center(
            child: CircularProgressIndicator(),
          );
        if (prayerProvider.prayers.isEmpty)
          return NoDataFound(
            btnText: 'Reload',
            onBtnClick: () => prayerProvider.updatePrayer(userId: _user.userId),
          );

        return Container(
          child: ListView.builder(
              itemCount: prayerProvider.prayers.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: prayerProvider.prayers[index],
                  key: ValueKey(prayerProvider.prayers[index]),
                  child: PrayerItem(),
                );
              }),
        );
      },
    );
  }
}

class PrayerItem extends StatelessWidget {
  final Function onEditClick;
  PrayerItem({this.onEditClick});

  _submitPrayed(BuildContext context, {@required Prayer prayer}) async {
    var user = Provider.of<UserProvider>(context, listen: false).getUser;
    // prayer.onUpdateNoOfComment(60);
    // prayer.noOfComment = 120;
    // prayer.noOfPrays = 34;
    // prayer.update(prayer);
    if (prayer.havePrayed) {
      AlertUtils.toast('you have already prayed for this request');
      return;
    }

    AlertUtils.showProgressDialog(context, title: null);
    ServerResponse serverResponse = await PrayerRepo.addPrayerCommit(prayerId: prayer.prayerId, userId: user.userId);
    if (serverResponse.success) {
      Prayer updatedPrayer = await PrayerRepo.getPrayer(prayerId: prayer.prayerId, userId: user.userId);
      if (updatedPrayer != null) prayer.update(updatedPrayer);
      AlertUtils.hideProgressDialog(context);
    } else {
      AlertUtils.hideProgressDialog(context);
      AlertUtils.toast(serverResponse.message);
    }
  }

  _navigate(BuildContext context, {Prayer prayer}) {
    if (onEditClick == null)
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider.value(
            value: prayer,
            key: ValueKey(prayer),
            child: PrayerDetail(),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    var prayer = Provider.of<Prayer>(context);

    return InkWell(
      onTap: () => _navigate(context, prayer: prayer),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: kColorTextGrey.withOpacity(.2)))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    prayer.prayerTitle,
                    style: listStyleTitle,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: colorsRanges[Random().nextInt(colorsRanges.length)],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    prayer.prayerCategory,
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              prayer.prayerDescription ?? "",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: kColorDarkBlue.withOpacity(.8),
                fontSize: 14,
                // letterSpacing: 1
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${prayer.userName} • ${Utilities.formatDate(prayer.timestamp)}',
                style: TextStyle(
                  color: kColorDarkBlue.withOpacity(.5),
                  fontSize: 12,
                ),
              ),
            ),
            Divider(),
            Row(
              children: [
                InkWell(
                  onTap: () => _submitPrayed(context, prayer: prayer),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.white70, width: 4),
                      color: (!prayer.havePrayed) ? kColorPrimary : kColorAshLight2,
                    ),
                    child: Text(
                      (prayer.havePrayed) ? 'Prayed' : 'Pray',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Spacer(),
                if (onEditClick != null)
                  InkWell(
                    onTap: onEditClick,
                    child: Icon(Icons.edit, color: kColorAsh),
                  ),
                SizedBox(width: 6),
                //Show Photo Icon if photo url isn't empty
                if (prayer.prayerFilePath.isNotEmpty) ImageFileIcon(onClick: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ViewImage(imageUrl: prayer.prayerFilePath)))),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.clean_hands_outlined,
                        size: 18,
                        color: kColorDarkBlue.withOpacity(.8),
                      ),
                      Text(
                        ' ${prayer.noOfPrays}',
                        style: TextStyle(color: kColorDarkBlue.withOpacity(.8), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.mark_chat_unread_rounded,
                        size: 16,
                        color: kColorDarkBlue.withOpacity(.8),
                      ),
                      Text(
                        '${prayer.noOfComment}',
                        style: TextStyle(color: kColorDarkBlue.withOpacity(.8), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
