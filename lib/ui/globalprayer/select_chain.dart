import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gopraying/utils/colors.dart';

class SelectChain extends StatefulWidget {
  @override
  _SelectChainState createState() => _SelectChainState();
}

class _SelectChainState extends State<SelectChain> {
  int _selectedPrayerChain = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        height: 200,
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Container(
          child: Column(
            children: [
              ListTile(
                trailing: CircleAvatar(
                  backgroundColor: Colors.blueGrey.withOpacity(.1),
                  radius: 16,
                  child: IconButton(
                    iconSize: 14,
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                  ),
                ),
                title: Text(
                  'Choose a prayer chain',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 12,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (build, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(),
                        child: GestureDetector(
                          onTap: () {
                            setState(() => _selectedPrayerChain = index);
                            // Navigator.pop(context);
                          },
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                    color: (_selectedPrayerChain == index) ? kColorPrimary : Colors.transparent,
                                    border: Border.all(
                                      color: (_selectedPrayerChain == index) ? Colors.transparent : kColorBlueBlack.withOpacity(.2),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today_rounded,
                                        size: 16,
                                        color: (_selectedPrayerChain == index) ? Colors.white : kColorBlueBlack.withOpacity(.6),
                                      ),
                                      Text(
                                        ' Chain 23',
                                        style: TextStyle(
                                          color: (_selectedPrayerChain == index) ? Colors.white : kColorBlueBlack.withOpacity(.6),
                                          fontSize: 13,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '2:00pm - 2:15pm',
                                  style: TextStyle(
                                    color: kColorBlueBlack.withOpacity(.6),
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 100,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: kColorPrimary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ' SET',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      Icon(
                        Icons.double_arrow_sharp,
                        size: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
