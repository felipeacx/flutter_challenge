import 'package:flutter/material.dart';
import 'package:flutter_challenge/screens/movies/ui/screens/home_discover.dart';
import 'package:flutter_challenge/screens/splashscreen/ui/screens/splashscreen.dart';
import 'package:flutter_challenge/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Challenge',
        theme: ThemeData(
          primarySwatch: primaryColor,
        ),
        initialRoute: 'splashscreen',
        routes: {
          // Splashscreen Route
          SplashScreen.routeName: (BuildContext context) =>
              const SplashScreen(),
          // Discover Movies Home Page Route
          HomeDiscover.routeName: (BuildContext context) =>
              const HomeDiscover(),
        });
  }
}
