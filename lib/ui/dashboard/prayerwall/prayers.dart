import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gopraying/ui/dashboard/prayerwall/prayer_detail.dart';
import 'package:gopraying/ui/widgets/global_styles.dart';
import 'package:gopraying/utils/colors.dart';
import 'package:gopraying/utils/constants.dart';

class Prayers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 40,
          itemBuilder: (context, index) {
            return PrayerItem();
          }),
    );
  }
}

class PrayerItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PrayerDetail())),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: kColorTextGrey.withOpacity(.2)))),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Deliverance from accident from accident',
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
                    'Marriage',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              loremData,
              style: TextStyle(
                color: kColorDarkBlue.withOpacity(.8),
                fontSize: 14,
                // letterSpacing: 1
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Kingsley Chinwe • 30 mins agobn',
                style: TextStyle(
                  color: kColorDarkBlue.withOpacity(.5),
                  fontSize: 12,
                ),
              ),
            ),
            Divider(),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.white70, width: 4),
                    color: kColorPrimary,
                  ),
                  child: Text(
                    'Pray',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
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
                        ' 21',
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
                        '32',
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
