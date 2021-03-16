import 'package:flutter/material.dart';
import 'package:gopraying/ui/globalprayer/globalprayers.dart';
import 'package:gopraying/ui/podcast/podcats.dart';
import 'package:gopraying/ui/widgets/global_styles.dart';
import 'package:gopraying/utils/colors.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SeeMoreTitle(
            title: 'Global Prayer Campaign',
            onSeeMoreClick: () => null,
          ),
          SizedBox(height: 4),
          Container(
            height: 165,
            child: ListView.builder(
              itemCount: 11,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width - 80,
                  margin: EdgeInsets.only(right: 8),
                  child: GlobalPrayerItem(),
                );
              },
            ),
          ),
          SeeMoreTitle(
            title: 'Coming Events',
            onSeeMoreClick: () => null,
          ),
          SizedBox(height: 4),
          Container(
            height: 165,
            child: ListView.builder(
              itemCount: 11,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width - 80,
                  margin: EdgeInsets.only(right: 8),
                  child: EventItem(),
                );
              },
            ),
          ),
          SeeMoreTitle(
            title: 'Daily Devotional',
            onSeeMoreClick: () => null,
          ),
          SizedBox(height: 4),
          Container(
            height: 165,
            child: ListView.builder(
              itemCount: 11,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width - 80,
                  margin: EdgeInsets.only(right: 8),
                  child: DevotionItem(),
                );
              },
            ),
          ),
          SeeMoreTitle(
            title: 'Podcats',
            onSeeMoreClick: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Podcasts())),
          ),
          SizedBox(height: 4),
          Container(
            height: 190,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  margin: EdgeInsets.only(right: 8),
                  child: PodcastItem(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SeeMoreTitle extends StatelessWidget {
  final title;
  final Function onSeeMoreClick;
  SeeMoreTitle({@required this.title, @required this.onSeeMoreClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: listStyleTitle),
            InkWell(
              onTap: onSeeMoreClick,
              child: Text(
                'SEE ALL',
                style: TextStyle(color: kColorPrimary, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class EventItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GlobalPrayerDetail())),
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.blueGrey[900].withAlpha(50), blurRadius: 2.0)],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/gradient_bg.png',
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.3),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DevotionItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GlobalPrayerDetail())),
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.blueGrey[900].withAlpha(50), blurRadius: 2.0)],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/gradient_bg.png',
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: 150,
              padding: EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Text(
                    'Wed, Sept 12, 2021',
                    style: TextStyle(color: Colors.white.withOpacity(.8), fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.double_arrow_sharp,
                    color: Colors.white.withOpacity(.8),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PodcastItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            color: Colors.white,
            border: Border.all(color: Colors.black12),
            boxShadow: [BoxShadow(color: Colors.blueGrey[300].withAlpha(50), blurRadius: 10.0)]),
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Image.asset(
                  'assets/images/gradient_bg.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 100,
                ),
                Container(
                  width: double.infinity,
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
            Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'How to do well in all things that partains to GOD',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  SizedBox(height: 8),
                  Divider(height: 2, color: Colors.blueGrey[100]),
                  SizedBox(height: 4),
                  Text(
                    "Finance",
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
