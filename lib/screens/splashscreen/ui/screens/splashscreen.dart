import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/screens/movies/ui/screens/home_discover.dart';
import 'package:flutter_challenge/screens/splashscreen/ui/widgets/loader_animation.dart';
import 'package:flutter_challenge/utils/Responsive.dart';
import 'package:flutter_challenge/utils/theme.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/";

  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Responsive responsive;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.pushNamed(context, HomeDiscover.routeName));
  }

  @override
  Widget build(BuildContext context) {
    responsive = Responsive(context);

    return Container(
        color: primaryColor,
        child: Stack(
          children: [
            Positioned(
              top: responsive.hp(20.0),
              child: SizedBox(
                width: responsive.wp(100.0),
                child: Center(
                  child: Text(
                    "Bienvenido",
                    style: TextStyle(
                        fontSize: responsive.dp(10.0),
                        color: whiteColor,
                        decoration: TextDecoration.none),
                  ),
                ),
              ),
            ),
            Positioned(
              top: responsive.hp(50.0),
              child: SizedBox(
                width: responsive.wp(100.0),
                child: Center(
                  child: Loading(
                    radius: responsive.wp(20.0),
                    dotRadius: responsive.dp(20.0),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: responsive.hp(10.0),
              child: SizedBox(
                width: responsive.wp(100.0),
                child: Center(
                  child: Text(
                    "Las mejores películas te esperan",
                    style: TextStyle(
                        fontSize: responsive.dp(4.5),
                        color: grayColor,
                        decoration: TextDecoration.none),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
