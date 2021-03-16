import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gopraying/utils/colors.dart';
import 'package:gopraying/utils/constants.dart';

class GlobalPrayerComment extends StatefulWidget {
  @override
  _GlobalPrayerCommentState createState() => _GlobalPrayerCommentState();
}

class _GlobalPrayerCommentState extends State<GlobalPrayerComment> {
  TextEditingController _commentController = TextEditingController();
  FocusNode _commentFocusNode = FocusNode();

  bool isWriting = false;

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
          'Comments',
          style: TextStyle(color: kColorDarkBlue, fontSize: 24),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return GlobalPrayerCommentItem();
                    }),
              ),
              inputContainer()
            ],
          ),
        ),
      ),
    );
  }

  Container inputContainer() {
    return Container(
      padding: EdgeInsets.only(top: 4, bottom: 4, right: 10),
      decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Colors.blueGrey.withOpacity(.2)))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                TextField(
                  controller: _commentController,
                  focusNode: _commentFocusNode,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: (val) {
                    if (val.length > 0 && val.trim() != "" && !isWriting)
                      setState(() => isWriting = true);
                    else if (val.trim() == "" && isWriting) setState(() => isWriting = false);
                  },
                  decoration: InputDecoration(
                    hintText: "Enter a comment",
                    hintStyle: TextStyle(color: kColorAshLight2),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 5,
          ),
          if (isWriting)
            Container(
              margin: EdgeInsets.only(left: 5),
              decoration: BoxDecoration(color: kColorPrimary, shape: BoxShape.circle),
              child: IconButton(
                icon: Icon(
                  Icons.send,
                  size: 18,
                  color: Colors.white,
                ),
                onPressed: null,
              ),
            )
        ],
      ),
    );
  }
}

class GlobalPrayerCommentItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = colorsRanges[Random().nextInt(colorsRanges.length)];

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.blueGrey[900].withAlpha(50), blurRadius: 2.0),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(topRight: Radius.circular(4)),
              ),
              child: Text(
                '20 mins ago',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Emeka Chucks',
                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold
                      // letterSpacing: 1
                      ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.only(top: 12),
                  decoration: BoxDecoration(
                    border: Border(left: BorderSide(color: color, width: 3)),
                  ),
                  child: Text(
                    loremData,
                    style: TextStyle(
                      color: kColorDarkBlue.withOpacity(.8),
                      fontSize: 14,
                      // letterSpacing: 1
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
