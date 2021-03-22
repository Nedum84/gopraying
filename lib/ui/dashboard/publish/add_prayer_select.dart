import 'package:flutter/material.dart';
import 'package:gopraying/ui/dashboard/publish/add_prayer.dart';
import 'package:gopraying/utils/colors.dart';

class AddPrayerSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: ColorUtil.gradient(colors: [
            Colors.white,
            kColorAshLight2.withOpacity(.6),
            Colors.black12,
          ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddPrayer())),
              child: Column(
                children: [
                  Icon(
                    Icons.add_circle_outline,
                    size: 64,
                    color: kColorDarkBlue.withOpacity(.8),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'ADD A PRAYER',
                    style: TextStyle(
                      fontSize: 22,
                      color: kColorDarkBlue.withOpacity(.8),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              child: Column(
                children: [
                  Icon(
                    Icons.speaker_phone_outlined,
                    size: 64,
                    color: kColorDarkBlue.withOpacity(.8),
                  ), //settings_input_antenna_outlined
                  SizedBox(height: 8),
                  Text(
                    'TESTIFY',
                    style: TextStyle(
                      fontSize: 22,
                      color: kColorDarkBlue.withOpacity(.8),
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
