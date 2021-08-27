import 'package:flutter/material.dart';
import 'package:pizza_app/home/main_screen.dart';
import 'package:pizza_app/models/Pizza.dart';

class ListOfPizzaImages extends StatelessWidget {
  const ListOfPizzaImages(
      {Key? key,
      required this.onPageChanged,
      required this.dragUpdate,
      required this.rotationController,
      this.scaleController,
      this.scaleAnimation})
      : super(key: key);

  final onPageChanged;
  final dragUpdate;
  final AnimationController rotationController;
  final scaleController;
  final scaleAnimation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: pizzaWidth,
      child: PageView(
        physics: ClampingScrollPhysics(),
        controller: pizzaController,
        onPageChanged: this.onPageChanged,
        scrollDirection: Axis.horizontal,
        children: List.generate(
          listOfPizza.length,
          (index) => GestureDetector(
            onHorizontalDragUpdate: this.dragUpdate,
            child: RotationTransition(
              turns: Tween(begin: 0.0, end: 0.2).animate(CurvedAnimation(
                  parent: this.rotationController,
                  curve: Curves.bounceIn,
                  reverseCurve: Curves.bounceOut)),
              child: Transform.scale(
                scale: drag ? 0.9 : 1,
                child: Transform.scale(
                  scale: scaleAnimation.value,
                  child: Image.asset(
                    listOfPizza[index].image.toString(),
                    width: 260,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
