import 'package:flutter/material.dart';
import 'package:pizza_app/home/main_screen.dart';
import 'package:pizza_app/models/Topping.dart';

class ToppingsList extends StatelessWidget {
  const ToppingsList(
      {Key? key,
      required this.onPageChanged,
      required this.onItemFocus,
      this.onTap,
      required this.controller,
      required this.dragUpdate})
      : super(key: key);

  final onPageChanged;
  final onItemFocus;
  final onTap;
  final PageController controller;
  final dragUpdate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: PageView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          onPageChanged: this.onPageChanged,
          itemBuilder: (contex, index) {
            return Transform.scale(
              scale: currentToppingPage == index ? 1.5 : 0.8,
              child: GestureDetector(
                onHorizontalDragUpdate: this.dragUpdate,
                onTap: this.onTap,
                child: Container(
                  margin: EdgeInsets.only(
                      top: currentToppingPage == index ? 30 : 0),
                  child: Opacity(
                    opacity:
                        listOfTopping[index % listOfTopping.length].isSelected
                            ? 0.5
                            : 1,
                    child: Image.asset(
                      listOfTopping[index % listOfTopping.length]
                          .image
                          .toString(),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

// Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: 150,
//       child: PageView.builder(
//           controller: PageController(
//               initialPage: currentToppingPage, viewportFraction: 1 / 4),
//           scrollDirection: Axis.horizontal,
//           onPageChanged: this.onPageChanged,
//           itemBuilder: (contex, index) {
//             return Transform.scale(
//               scale: currentToppingPage == index ? 1 : 0.8,
//               child: Container(
//                 margin:
//                     EdgeInsets.only(top: currentToppingPage == index ? 50 : 0),
//                 child: Image.asset(
//                   listOfTopping[index % listOfTopping.length].image.toString(),
//                 ),
//               ),
//             );
//           }),
//     );
//   }
