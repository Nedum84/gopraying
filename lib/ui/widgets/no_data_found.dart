import 'package:flutter/material.dart';
import 'package:gopraying/utils/colors.dart';

class NoDataFound extends StatelessWidget {
  final String btnText;
  final String subTitle;
  final Color btnBgColor;
  final Function onBtnClick;

  NoDataFound({@required this.btnText, this.subTitle, this.onBtnClick, this.btnBgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            subTitle ?? 'Nothing found?',
            style: TextStyle(color: Colors.blueGrey, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: onBtnClick,
            child: Container(
              width: 200,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25.00)),
                color: (btnBgColor!=null)?btnBgColor:kColorPrimary,
                boxShadow: [
                  BoxShadow(color: kColorAshLight2, blurRadius: 20.0),
                ],
              ),
              child: Text(
                btnText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}