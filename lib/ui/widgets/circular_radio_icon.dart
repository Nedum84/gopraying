import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gopraying/utils/colors.dart';


class CircularRadioIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kColorPrimary.withOpacity(.8)
      ),
      child: Icon(Icons.check, color: Colors.white, size: 20,),
    );
  }
}
