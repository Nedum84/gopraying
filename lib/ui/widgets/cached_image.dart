import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gopraying/utils/colors.dart';



const NO_IMAGE = 'assets/images/logo.png';
const USER = "https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-512.png";

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final bool isRound;
  final double radius;
  final double height;
  final double width;

  final BoxFit fit;
  final ImagePlaceholder alt;

  CachedImage(
    this.imageUrl, {
    this.isRound = false,
    this.radius = 0,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.alt = ImagePlaceholder.NoImage,
  });

  @override
  Widget build(BuildContext context) {
    String alt;
    switch (this.alt) {
      case ImagePlaceholder.NoImage:
        alt = NO_IMAGE;
        break;
      case ImagePlaceholder.User:
        alt = USER;
        break;
      default:
        alt = NO_IMAGE;
    }

    try {
      return SizedBox(
        height: isRound ? radius : height,
        width: isRound ? radius : width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(isRound ? 50 : radius),
          child:CachedNetworkImage(
            imageUrl: imageUrl,
            fit: fit,
            placeholder: (context, url) => Container(width: 50, height: 50, alignment: Alignment.center, child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => ClipRRect(
              borderRadius: BorderRadius.circular(isRound ? 50 : radius),
              child: Image.network(
                imageUrl,
                height: isRound ? radius : height,
                width: isRound ? radius : width,
                fit: fit,
              ),
            ),
          ),
        ),
      );
    } catch (e) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(isRound ? 50 : radius),
        child: Image.asset(
          alt,
          height: isRound ? radius : height,
          width: isRound ? radius : width,
          fit: fit,
          // color: kColorAsh,
        ),
      );
    }
  }
}

enum ImagePlaceholder { NoImage, User }
