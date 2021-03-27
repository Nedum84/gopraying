import 'package:flutter/material.dart';
import 'package:gopraying/utils/colors.dart';

class AddImageWidget extends StatelessWidget {
  final Function onClick;
  AddImageWidget({@required this.onClick});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: onClick,
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
    );
  }
}
