import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gopraying/provider/scroll_direction_provider.dart';
import 'package:gopraying/ui/dashboard/prayerwall/add_comment.dart';
import 'package:gopraying/ui/dashboard/prayerwall/prayers.dart';
import 'package:gopraying/ui/widgets/global_styles.dart';
import 'package:gopraying/ui/widgets/text_avatar.dart';
import 'package:gopraying/utils/colors.dart';
import 'package:gopraying/utils/constants.dart';
import 'package:provider/provider.dart';

class PrayerDetail extends StatefulWidget {
  @override
  _PrayerDetailState createState() => _PrayerDetailState();
}

class _PrayerDetailState extends State<PrayerDetail> {
  ScrollController _scrollController;
  ScrollDirectionProvider scrollDirection;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        var upDirection = _scrollController.position.userScrollDirection == ScrollDirection.forward;

        if (upDirection && scrollDirection.scrollUp != true) {
          scrollDirection.onScrollChange(true);
          //scrolling up
        } else if (!upDirection && scrollDirection.scrollUp != false) {
          scrollDirection.onScrollChange(false);
        }
      });
  }

  _openComment() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddComment()));
  }

  @override
  Widget build(BuildContext context) {
    scrollDirection = Provider.of<ScrollDirectionProvider>(context);

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
          'Prayer Request',
          style: TextStyle(color: kColorDarkBlue, fontSize: 24),
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
          controller: _scrollController,
          children: [
            PrayerItem(),
            Container(padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), decoration: BoxDecoration(color: kColorAshLight2), child: Text('Comments')),
            ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: 20,
                padding: EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: kColorTextGrey.withOpacity(.2)))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          child: TextAvatar(
                            text: 'E',
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  loremData,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: kColorDarkBlue.withOpacity(.8),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 6),
                                  decoration: BoxDecoration(
                                    border: Border(top: BorderSide(color: kColorTextGrey.withOpacity(.08))),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
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
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        'Christian Vally',
                                        style: listStyleTitleComment,
                                      ),
                                      Text(
                                        '@ 12pm',
                                        style: TextStyle(color: kColorTextGrey.withOpacity(.7), fontSize: 10),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
      floatingActionButton: AnimatedOpacity(
        duration: Duration(milliseconds: 1000),
        opacity: scrollDirection.scrollUp ? 1 : 0,
        // opacity: .5,
        // opacity: _scrollController.offset,
        child: GestureDetector(
          onTap: _openComment,
          child: Container(
            width: 150,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            decoration: BoxDecoration(
              color: kColorPrimary.withOpacity(.8),
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
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
