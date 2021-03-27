import 'package:flutter/material.dart';
import 'package:gopraying/utils/colors.dart';

class ImageFileIcon extends StatelessWidget {
  final Function onClick;
  ImageFileIcon({@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(
          color: kColorAshLight2,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: kColorPrimary.withOpacity(.3), width: 1),
        ),
        child: Row(
          children: [
            Icon(
              Icons.attach_file,
              color: kColorDarkBlue.withOpacity(.8),
              size: 12,
            ),
            Text(' Photo')
          ],
        ),
      ),
    );
  }
}
