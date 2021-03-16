import 'package:flutter/material.dart';
import 'package:gopraying/ui/globalprayer/select_chain.dart';
import 'package:gopraying/utils/colors.dart';
import 'package:gopraying/utils/constants.dart';

import 'globalprayer_comment.dart';

class GlobalPrayerDetail extends StatelessWidget {
  _openPrayerChainModal(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (build) {
          return SelectChain();
        });
  }

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
      ),
      body: ListView(
        // padding: EdgeInsets.all(16),
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black,
                ),
                Positioned(
                  bottom: -30,
                  left: 30,
                  child: Container(
                    decoration: BoxDecoration(
                      color: kColorPrimary,
                      // gradient: ColorUtil.gradient(colors: [kColorRed, kColorPrimary]),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 6),
                    ),
                    height: 60,
                    width: 60,
                    child: Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Column(
              children: [
                Text(
                  'Deliverance from evil of the mah from evil of the mah',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.timer,
                            color: Color(0xffffab73),
                            size: 20,
                          ),
                          Text(
                            "23 Feb'21 - 45th Mar'21",
                            style: TextStyle(
                              color: kColorDarkBlue.withOpacity(.6),
                              fontSize: 14,
                              // letterSpacing: 1
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                    color: kColorPrimary,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: kColorPrimary.withOpacity(.6)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.precision_manufacturing_outlined,
                        size: 24,
                        color: Colors.white.withOpacity(.8),
                      ),
                      Text(
                        'JOIN',
                        style: TextStyle(color: Colors.white.withOpacity(.8), fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Text(
                  loremData,
                  style: TextStyle(
                    color: kColorDarkBlue.withOpacity(.8),
                    fontSize: 16,
                    // letterSpacing: 1
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => _openPrayerChainModal(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                          decoration: BoxDecoration(
                            color: kColorPrimary.withOpacity(.05),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: kColorPrimary.withOpacity(.2)),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.precision_manufacturing_outlined,
                                size: 24,
                                color: kColorDarkBlue.withOpacity(.8),
                              ),
                              Text(
                                'JOIN',
                                style: TextStyle(color: kColorDarkBlue.withOpacity(.8), fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                        decoration: BoxDecoration(
                          color: kColorRed.withOpacity(.05),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: kColorPrimary.withOpacity(.2)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.mark_chat_unread_rounded,
                              size: 24,
                              color: kColorDarkBlue.withOpacity(.8),
                            ),
                            Text(
                              '32',
                              style: TextStyle(color: kColorDarkBlue.withOpacity(.8), fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GlobalPrayerComment())),
        child: Container(
          width: 160,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: BoxDecoration(
            color: kColorPrimary.withOpacity(.9),
            borderRadius: BorderRadius.all(Radius.circular(25)),
            border: Border.all(width: 2, color: kColorPrimary),
            boxShadow: [
              BoxShadow(color: kColorPrimary.withOpacity(0.3), spreadRadius: 6, blurRadius: 12, offset: Offset(0, 3)),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Open Comment ',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              Icon(
                Icons.add_circle_outlined,
                color: Colors.white,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
