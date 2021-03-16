import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gopraying/ui/dashboard/testimony/testimony_comment.dart';
import 'package:gopraying/utils/colors.dart';
import 'package:gopraying/utils/constants.dart';

class Testimonies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xfff0f4fd),
      child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          itemCount: 40,
          itemBuilder: (context, index) {
            return TestimonyItem();
          }),
    );
  }
}

class TestimonyItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = colorsRanges[Random().nextInt(colorsRanges.length)];

    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TestimonyComment())),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.blueGrey[900].withAlpha(50), blurRadius: 2.0),
          ],
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'FINANCE',
                  style: TextStyle(color: color, fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: 16,
              child: Divider(
                color: kColorDarkBlue.withOpacity(.1),
                thickness: 1,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: color, width: 3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deliverance from evil of the mah from evil of the mah',
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                        // letterSpacing: 1
                        ),
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
                      'Kingsley Chinwe • 30 mins ago',
                      style: TextStyle(
                        color: kColorDarkBlue.withOpacity(.5),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                    color: kColorAshLight2,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.photo_camera_sharp,
                        color: kColorDarkBlue.withOpacity(.8),
                        size: 12,
                      ),
                      Text(' PHOTO')
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Color(0xfff0f4fd),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.thumb_up,
                        color: kColorDarkBlue.withOpacity(.8),
                        size: 12,
                      ),
                      Text('32')
                    ],
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Color(0xfff0f4fd),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.chat_rounded,
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
