import 'package:flutter/material.dart';
import 'package:pizza_app/constants.dart';
import 'package:pizza_app/home/main_screen.dart';

class FullAmount extends StatelessWidget {
  const FullAmount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = " KR";
    return TweenAnimationBuilder(
      tween: IntTween(begin: 0, end: pizzaFullAmount().toInt()),
      duration: Duration(milliseconds: 500),
      builder: (context, value, child) => Text(
        "$value$text",
        style: TextStyle(
            color: bodyTextColor, fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
