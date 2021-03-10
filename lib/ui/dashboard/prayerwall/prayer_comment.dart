import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gopraying/ui/dashboard/prayerwall/view_prayers.dart';
import 'package:gopraying/ui/widgets/text_avatar.dart';
import 'package:gopraying/utils/colors.dart';
import 'package:gopraying/utils/constants.dart';

class PrayerComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.white70,
        title: Text(
          'Prayer Request',
          style: TextStyle(color: kColorDarkBlue, fontSize: 32),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share, size: 32, color: kColorDarkBlue.withOpacity(.6)),
            onPressed: () => null,
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            PrayerItem(),
            Container(padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), decoration: BoxDecoration(color: kColorAshLight2), child: Text('Comments')),
            ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: kColorTextGrey.withOpacity(.2)))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 4, top: 16),
                          child: TextAvatar(
                            text: 'E',
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  loremData,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(top: BorderSide(color: kColorTextGrey.withOpacity(.1))),
                                  color: kColorAsh.withOpacity(.8),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Christian Vally',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      '@ 12pm',
                                      style: TextStyle(color: kColorTextGrey.withOpacity(.7), fontSize: 12),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Container(
          width: 200,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: BoxDecoration(
            color: kColorPrimary,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            border: Border.all(width: 2, color: kColorPrimary),
            boxShadow: [
              BoxShadow(color: kColorPrimary.withOpacity(0.3), spreadRadius: 2, blurRadius: 3, offset: Offset(0, 3)),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
              Text(
                'Add Comment',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
