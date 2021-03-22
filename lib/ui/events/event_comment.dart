import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gopraying/utils/colors.dart';
import 'package:gopraying/utils/constants.dart';

class EventComment extends StatefulWidget {
  @override
  _EventCommentState createState() => _EventCommentState();
}

class _EventCommentState extends State<EventComment> {
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
          'Event Comments',
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
                      return EventCommentItem();
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

class EventCommentItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.blueGrey[900].withAlpha(50), blurRadius: 2.0),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: colorsRanges[Random().nextInt(colorsRanges.length)].withOpacity(.3),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Chukwuma Odili'.toUpperCase(),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                ' • 5 mins ago',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: kColorDarkBlue.withOpacity(.8),
                  fontSize: 12,
                  // letterSpacing: 1
                ),
              ),
            ],
          ),
          Text(
            loremData,
            style: TextStyle(
              color: kColorDarkBlue.withOpacity(.8),
              fontSize: 14,
              // letterSpacing: 1
            ),
          ),
        ],
      ),
    );
  }
}
