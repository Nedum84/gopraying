import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gopraying/utils/colors.dart';

class Podcasts extends StatelessWidget {
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
          'Podcast',
          style: TextStyle(color: kColorDarkBlue, fontSize: 24),
        ),
      ),
      body: Container(
        child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: 40,
            itemBuilder: (context, index) {
              return PodcastItem();
            }),
      ),
    );
  }
}

class PodcastItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        boxShadow: [BoxShadow(color: Colors.blueGrey[300].withAlpha(50), blurRadius: 10.0)],
      ),
      child: Row(
        children: <Widget>[
          Stack(
            children: [
              Image.asset(
                'assets/images/gradient_bg.png',
                fit: BoxFit.cover,
                width: 120,
                height: 100,
              ),
              Container(
                width: 120,
                height: 100,
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.3),
                ),
                child: Text(
                  '2:78:12',
                  style: TextStyle(
                    color: Colors.white.withOpacity(.9),
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How to do well in all things that partains to GOD',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Wed, Mar 22, 2021",
                    style: TextStyle(fontSize: 12, color: Colors.black26),
                  ),
                  SizedBox(height: 4),
                  Divider(height: 2, color: Colors.blueGrey[100]),
                  SizedBox(height: 4),
                  Text(
                    "Finance",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, color: colorsRanges[Random().nextInt(colorsRanges.length)]),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
