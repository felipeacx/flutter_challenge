//Class to create a circle
import 'package:flutter/cupertino.dart';

class Circle extends StatelessWidget {
  const Circle({Key? key, required this.radius, required this.color})
      : super(key: key);
  final double radius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
