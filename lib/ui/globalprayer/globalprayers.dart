import 'package:flutter/material.dart';
import 'package:gopraying/ui/globalprayer/globalprayer_detail.dart';
import 'package:gopraying/utils/colors.dart';

class GlobalPrayers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.white70,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Global Prayers',
          style: TextStyle(color: kColorDarkBlue, fontSize: 24),
        ),
      ),
      body: Container(
        child: ListView.builder(
            padding: EdgeInsets.all(24),
            itemCount: 40,
            itemBuilder: (context, index) {
              return GlobalPrayerItem();
            }),
      ),
    );
  }
}

class GlobalPrayerItem extends StatelessWidget {
  final double width;
  GlobalPrayerItem({this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GlobalPrayerDetail())),
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.blueGrey[900].withAlpha(50), blurRadius: 2.0)],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/gradient_bg.png',
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.3),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
