import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gopraying/ui/widgets/cached_image.dart';
import 'package:gopraying/ui/widgets/view_image.dart';
import 'package:gopraying/utils/colors.dart';
import 'package:gopraying/utils/utilities.dart';

class ImagePreview extends StatelessWidget {
  final String imgUrl;
  final Function onDelClick;
  ImagePreview({@required this.onDelClick,@required this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ViewImage(imageUrl: imgUrl))),
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Stack(
          children: [
            (Utilities.isImgLocal(imgUrl))
                ? Image.file(
              File(imgUrl),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            )
                : CachedImage(
              imgUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.6),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Positioned(
              top: 6,
              right: 6,
              child: InkWell(
                onTap: onDelClick,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.5),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: kColorPrimary.withOpacity(.3), width: 1),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.clear,
                        color: Colors.white,
                        size: 12,
                      ),
                      Text(' remove')
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
