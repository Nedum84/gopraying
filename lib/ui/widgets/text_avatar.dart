import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gopraying/utils/colors.dart';

class TextAvatar extends StatelessWidget {
  final String text;
  final int length;

  TextAvatar({@required this.text, this.length = 1});

  String _txt(){
    if(length==1)
      return text[0];
    else if(length==2)
      return text.length==1?text[0]:(text[0]+text[1]??'').toUpperCase();
    else if(length==3)
      if(text.length==1)
        return text[0];
    if(text.length==2)
      return text.length==1?text[0]:(text[0]+text[1]??'').toUpperCase();
    else
      return (text[0]+text[1]??''+text[2]??'').toUpperCase();

  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: colorsRanges[Random().nextInt(colorsRanges.length)],
      child: Text(
        // text[0],
        _txt().toUpperCase(),
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
