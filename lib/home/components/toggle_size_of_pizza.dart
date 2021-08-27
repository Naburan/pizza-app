import 'package:flutter/material.dart';
import 'package:pizza_app/home/main_screen.dart';

class ToggleSizeOfPizza extends StatelessWidget {
  const ToggleSizeOfPizza({Key? key, required this.callback}) : super(key: key);

  final double width = 100.0;
  final double height = 50.0;
  final Color selectedColor = Colors.black87;
  final Color normalColor = Colors.black54;

  final void Function(int) callback;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width * 2,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(-6, 0),
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(6, 0),
            ),
            BoxShadow(
              color: Colors.white.withOpacity(1),
              spreadRadius: 3,
              blurRadius: 0,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: Alignment(xAlign, 0),
              duration: Duration(milliseconds: 200),
              child: Container(
                width: width * 0.5,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                callback(0);
              },
              child: Align(
                alignment: Alignment(-1, 0),
                child: Container(
                  width: width * 0.5,
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  child: Text(
                    'S',
                    style: TextStyle(
                      color: xAlign == -1 ? selectedColor : normalColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                callback(1);
              },
              child: Align(
                alignment: Alignment(0, 0),
                child: Container(
                  width: width * 0.5,
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  child: Text(
                    'M',
                    style: TextStyle(
                      color: xAlign == 0 ? selectedColor : normalColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                callback(2);
              },
              child: Align(
                alignment: Alignment(1, 0),
                child: Container(
                  width: width * 0.5,
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  child: Text(
                    'L',
                    style: TextStyle(
                      color: xAlign == 1 ? selectedColor : normalColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
