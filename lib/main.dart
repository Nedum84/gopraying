import 'package:flutter/material.dart';
import 'package:gopraying/ui/dashboard/dashboard.dart';
import 'package:provider/provider.dart';

import 'model/prayer.dart';
import 'provider/bottom_menu_provider.dart';
import 'provider/prayer_provider.dart';
import 'provider/scroll_direction_provider.dart';
import 'provider/user_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomMenuProvider()),
        ChangeNotifierProvider(create: (_) => ScrollDirectionProvider()),
        ChangeNotifierProvider(create: (_) => PrayerProvider()),
        ChangeNotifierProvider(create: (_) => PrayerProvider()),
        ChangeNotifierProvider(create: (_) => Prayer()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'GoPraying',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Dashboard(),
      ),
    );
  }
}
