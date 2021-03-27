import 'package:flutter/material.dart';
import 'package:gopraying/utils/colors.dart';

class DeleteIcon extends StatelessWidget {
  final Function onClick;
  DeleteIcon({@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: kColorRed.withOpacity(.7), width: 1),
        ),
        child: Text(' DELETE '),
      ),
    );
  }
}
