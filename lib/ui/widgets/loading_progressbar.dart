import 'package:flutter/material.dart';
import 'package:gopraying/utils/colors.dart';

class LoadingSpinner extends StatelessWidget {
  final Color bgColor;
  final Color spinnerColor;
  final Color spinnerBgColor;
  LoadingSpinner({this.bgColor = Colors.white10, this.spinnerColor = kColorPrimary, this.spinnerBgColor = Colors.black12});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 30,
        backgroundColor: bgColor,
        child: CircularProgressIndicator(
          // value: 3,
          valueColor: AlwaysStoppedAnimation<Color>(spinnerColor),
          backgroundColor: spinnerBgColor,
          strokeWidth: 4,
        ),
      ),
    );
  }
}

class LoadingProgressMultiColor extends StatefulWidget {
  final String title;
  final Color txtColor;

  LoadingProgressMultiColor({this.title, this.txtColor});

  @override
  _LoadingProgressMultiColorPageState createState() => _LoadingProgressMultiColorPageState();
}

class _LoadingProgressMultiColorPageState extends State<LoadingProgressMultiColor> with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: new Duration(seconds: 2), vsync: this);
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: CircularProgressIndicator(
              strokeWidth: 5,
              valueColor: animationController.drive(ColorTween(begin: kColorAccent, end: kColorPrimary)),
            ),
          ),
          SizedBox(height: 8,),
          (widget.title != null) ? Text(
                  widget.title,
                  style: TextStyle(
                    color: widget.txtColor??Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    decoration: TextDecoration.none,
                  ),
                )
              : Container(),
        ],
      )),
    );
  }
}
