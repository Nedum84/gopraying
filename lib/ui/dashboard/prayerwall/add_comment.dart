import 'package:flutter/material.dart';
import 'package:gopraying/utils/colors.dart';

class AddComment extends StatefulWidget {
  @override
  _AddCommentState createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  var textFieldController = TextEditingController();
  var textFieldFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          shadowColor: Colors.white70,
          leading: IconButton(
            icon: Icon(Icons.close, size: 32, color: kColorDarkBlue.withOpacity(.6)),
            onPressed: () => null,
          ),
          actions: [
            Text(
              'POST COMMENT',
              style: TextStyle(color: kColorDarkBlue, fontSize: 32),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              TextField(
                controller: textFieldController,
                focusNode: textFieldFocus,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
                decoration: InputDecoration(
                  hintText: "Enter your comment...",
                  hintStyle: TextStyle(
                    color: kColorAshLight2,
                  ),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.transparent,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
