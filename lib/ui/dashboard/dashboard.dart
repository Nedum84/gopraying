import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:gopraying/model/app_user.dart';
import 'package:gopraying/provider/bottom_menu_provider.dart';
import 'package:gopraying/provider/user_provider.dart';
import 'package:gopraying/ui/dashboard/donate.dart';
import 'package:gopraying/ui/dashboard/prayerwall/prayers.dart';
import 'package:gopraying/ui/dashboard/publish/add_prayer_select.dart';
import 'package:gopraying/ui/dashboard/testimony/testimonies.dart';
import 'package:gopraying/ui/events/events.dart';
import 'package:gopraying/utils/colors.dart';
import 'package:gopraying/utils/user_prefs.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  AppUser _appUser;

  BottomMenuProvider bottomMenuProvider;
  // FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    var u = AppUser(
      userId: 4,
      name: 'Edu ManH',
      email: 'edu@gmail.com',
      uid: 'gyhhvvhj,khj,bxsd',
      dateCreated: 1279785812,
      profilePhotoUrl: 'ppppppppppppppppppppp',
      phone: '08169981523',
      deviceToken: 'o816o91208192',
      accessLevel: 1,
      showNotification: true,
    );
    UserPrefs().setUDetails(appUser: u);
    UserPrefs().setUID(userId: 4);

    Provider.of<UserProvider>(context, listen: false).refreshUser();
    // _initFCM();
  }

  // _initFCM() {
  //   // firebaseMessaging.subscribeToTopic('all');
  //   // firebaseMessaging.unsubscribeFromTopic('all');
  //   firebaseMessaging.configure(
  //     onMessage: (Map<String, dynamic> message) async {
  //       // showNotification(message);
  //       print(" onMessage called ${(message)}");
  //     },
  //     onResume: (Map<String, dynamic> msg) async {
  //       showNotification(msg);
  //       print(" onResume called ${(msg)}");
  //     },
  //     onLaunch: (Map<String, dynamic> msg) async {
  //       showNotification(msg);
  //       print(" onMessage called ${(msg)}");
  //     },
  //   );
  //   firebaseMessaging.requestNotificationPermissions(const IosNotificationSettings(sound: true, alert: true, badge: true));
  //   firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings setting) {
  //     print('IOS Setting Registered');
  //   });
  //   firebaseMessaging.getToken().then((token) {
  //     update(token);
  //   });
  // }

  //Notification routing...
  // showNotification(Map<String, dynamic> msg) async {
  //   var data = msg['data'];
  //   var type = data['type'];
  //   var id = data['id'];
  //   var idSecondary = data['id_secondary'];
  //
  //   if(type == 'question'){
  //     var questionId = id;
  //     var question = await QuestionRepo.getQuestion(questionId: questionId);
  //     if(question!=null)
  //       Navigator.push(context, MaterialPageRoute(builder: (ctx)=> ViewAnswer(question: question)));
  //   }else{
  //     var answerId = id;
  //     var questionId = idSecondary;
  //     var question = await QuestionRepo.getQuestion(questionId: questionId);
  //     if(question!=null)
  //       Navigator.push(context, MaterialPageRoute(builder: (ctx)=> ViewAnswer(question: question)));
  //   }
  // }

  // update(String token) async{
  //   print('token: '+token);
  //   AuthRepo.updateProfile(data: {'device_token':token, 'user_id':'${await UserPrefs.getUID()}'} );
  //   firebaseMessaging.subscribeToTopic('all');
  //   firebaseMessaging.subscribeToTopic('student');
  // }

  _gotoProfile() {
    // if (_appUser.isTeacher())
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => ViewProfileTeacher()));
    // else
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => ViewProfile()));
  }

  List<Widget> pageList = <Widget>[
    Home(),
    Prayers(),
    Testimonies(),
    Donate(),
  ];

  String titleText(int idx) {
    String _title;
    switch (idx) {
      case 0:
        _title = 'Home';
        break;
      case 1:
        _title = "Prayers";
        break;
      case 2:
        _title = "Testimonies";
        break;
      case 3:
        _title = "Donate";
        break;
      default:
        _title = "Home";
    }
    return _title;
  }

  _backPressed() {
    if (bottomMenuProvider.bottomMenuItem != 0) {
      bottomMenuProvider.onChangeMenu(0);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    bottomMenuProvider = Provider.of<BottomMenuProvider>(context);
    int pageIndex = bottomMenuProvider.bottomMenuItem ?? 0;
    return WillPopScope(
      onWillPop: () => Future.value(_backPressed()),
      child: FutureBuilder<AppUser>(
          future: UserPrefs.getUDetails(),
          builder: (context, snapshot) {
            // if (!snapshot.hasData) return Container(width: double.infinity, height: double.infinity, color: Colors.blue);

            // _appUser = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 1,
                shadowColor: Colors.white70,
                title: Text(
                  titleText(pageIndex),
                  style: TextStyle(color: kColorDarkBlue, fontSize: 32),
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.account_box, size: 32, color: kColorDarkBlue.withOpacity(.6)),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Events(),
                      ),
                    ),
                  ),
                ],
              ),
              body: PageTransitionSwitcher(
                transitionBuilder: (Widget child, Animation<double> animation, Animation<double> secondaryAnimation) {
                  return FadeThroughTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  );
                },
                child: pageList[pageIndex],
                duration: const Duration(milliseconds: 800),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(
                elevation: 0,
                backgroundColor: kColorPrimary,
                child: const Icon(
                  Icons.add,
                  size: 32,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddPrayerSelect()));
                },
              ),
              bottomNavigationBar: BottomAppBar(
                shape: CircularNotchedRectangle(),
                notchMargin: 4.0,
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    BottomMenuWidget(
                      onClick: () => bottomMenuProvider.onChangeMenu(0),
                      title: 'Home',
                      icon: Icons.dashboard,
                      bottomMenuIndex: 0,
                    ),
                    BottomMenuWidget(
                      onClick: () => bottomMenuProvider.onChangeMenu(1),
                      title: 'Prayers',
                      icon: Icons.offline_share,
                      bottomMenuIndex: 1,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    BottomMenuWidget(
                      onClick: () => bottomMenuProvider.onChangeMenu(2),
                      title: 'Testify',
                      icon: Icons.chat_outlined,
                      bottomMenuIndex: 2,
                    ),
                    BottomMenuWidget(
                      onClick: () => bottomMenuProvider.onChangeMenu(3),
                      title: 'Donate',
                      icon: Icons.favorite_rounded,
                      bottomMenuIndex: 3,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class BottomMenuWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onClick;
  final int bottomMenuIndex;

  BottomMenuWidget({this.title, this.icon, this.bottomMenuIndex, this.onClick});

  @override
  Widget build(BuildContext context) {
    var bottomMenuProvider = Provider.of<BottomMenuProvider>(context, listen: false);

    return InkWell(
      onTap: () => onClick(),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: (bottomMenuProvider.bottomMenuItem == bottomMenuIndex) ? Colors.blueGrey : Colors.black12,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 12, color: (bottomMenuProvider.bottomMenuItem == bottomMenuIndex) ? Colors.blueGrey : Colors.black12),
            )
          ],
        ),
      ),
    );
  }
}
