import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/screens/splashscreen/ui/widgets/circles.dart';
import 'package:flutter_challenge/utils/theme.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key, this.radius = 30.0, this.dotRadius = 3.0})
      : super(key: key);
  final double radius;
  final double dotRadius;

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  late Animation<double> animation_rotation;
  late AnimationController controller;

  late double radius;
  late double dotRadius;

  @override
  void initState() {
    //Initialize animations
    super.initState();
    //Radius
    radius = widget.radius;
    dotRadius = widget.dotRadius;
    //Animation controller
    controller = AnimationController(
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: const Duration(milliseconds: 3000),
        vsync: this);
    //Rotation of circles
    animation_rotation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );
    //Repeat animation forever
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0,
      height: 100.0,
      child: Center(
        child: RotationTransition(
          turns: animation_rotation,
          child: Container(
            color: secondaryColor,
            child: Center(
              //Stack with circles
              child: Stack(
                children: <Widget>[
                  //Circles with translation animation
                  Transform.translate(
                    offset: const Offset(0.0, 0.0),
                    child: Circle(
                      radius: radius,
                      color: secondaryColor,
                    ),
                  ),
                  Transform.translate(
                    child: Circle(
                      radius: dotRadius,
                      color: secondaryColor,
                    ),
                    offset: Offset(
                      radius * cos(0.0),
                      radius * sin(0.0),
                    ),
                  ),
                  Transform.translate(
                    child: Circle(
                      radius: dotRadius,
                      color: secondaryColor,
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 1 * pi / 4),
                      radius * sin(0.0 + 1 * pi / 4),
                    ),
                  ),
                  Transform.translate(
                    child: Circle(
                      radius: dotRadius,
                      color: secondaryColor,
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 2 * pi / 4),
                      radius * sin(0.0 + 2 * pi / 4),
                    ),
                  ),
                  Transform.translate(
                    child: Circle(
                      radius: dotRadius,
                      color: secondaryColor,
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 3 * pi / 4),
                      radius * sin(0.0 + 3 * pi / 4),
                    ),
                  ),
                  Transform.translate(
                    child: Circle(
                      radius: dotRadius,
                      color: secondaryColor,
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 4 * pi / 4),
                      radius * sin(0.0 + 4 * pi / 4),
                    ),
                  ),
                  Transform.translate(
                    child: Circle(
                      radius: dotRadius,
                      color: secondaryColor,
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 5 * pi / 4),
                      radius * sin(0.0 + 5 * pi / 4),
                    ),
                  ),
                  Transform.translate(
                    child: Circle(
                      radius: dotRadius,
                      color: secondaryColor,
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 6 * pi / 4),
                      radius * sin(0.0 + 6 * pi / 4),
                    ),
                  ),
                  Transform.translate(
                    child: Circle(
                      radius: dotRadius,
                      color: secondaryColor,
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 7 * pi / 4),
                      radius * sin(0.0 + 7 * pi / 4),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
