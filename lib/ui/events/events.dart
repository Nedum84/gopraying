import 'package:flutter/material.dart';
import 'package:gopraying/ui/events/event_detail.dart';
import 'package:gopraying/utils/colors.dart';
import 'package:gopraying/utils/constants.dart';

class Events extends StatelessWidget {
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
          'Events',
          style: TextStyle(color: kColorDarkBlue, fontSize: 24),
        ),
      ),
      body: Container(
        child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            itemCount: 40,
            itemBuilder: (context, index) {
              return EventItem();
            }),
      ),
    );
  }
}

class EventItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetail())),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.blueGrey[900].withAlpha(50), blurRadius: 2.0),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/gradient_bg.png',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deliverance from evil of the mah from evil of the mah',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          children: [
                            Icon(
                              Icons.timer,
                              color: Color(0xffffab73),
                              size: 18,
                            ),
                            Text(
                              "23 Feb'21 - 45th Mar'21",
                              style: TextStyle(
                                color: kColorDarkBlue.withOpacity(.6),
                                fontSize: 12,
                                // letterSpacing: 1
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: Row(
                          children: [
                            Icon(
                              Icons.track_changes,
                              size: 14,
                              color: kColorDarkBlue.withOpacity(.4),
                            ),
                            Text(
                              '45',
                              style: TextStyle(
                                color: kColorDarkBlue.withOpacity(.6),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Text(
                    loremData,
                    style: TextStyle(
                      color: kColorDarkBlue.withOpacity(.8),
                      fontSize: 14,
                      // letterSpacing: 1
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
