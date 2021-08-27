import 'package:flutter/material.dart';

class AddandSubstract extends StatelessWidget {
  const AddandSubstract({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Spacer(flex: 1),
        RawMaterialButton(
          onPressed: () {},
          child: Text(
            "-",
            style: TextStyle(fontSize: 30),
          ),
          padding: EdgeInsets.all(5),
          fillColor: Colors.white,
          shape: CircleBorder(
            side: BorderSide(
              width: 5,
              color: Colors.white,
              style: BorderStyle.solid,
            ),
          ),
        ),
        Spacer(flex: 4),
        RawMaterialButton(
          onPressed: () {},
          child: Text(
            "+",
            style: TextStyle(fontSize: 30),
          ),
          padding: EdgeInsets.all(5),
          fillColor: Colors.white,
          shape: CircleBorder(
            side: BorderSide(
              width: 5,
              color: Colors.white,
              style: BorderStyle.solid,
            ),
          ),
        ),
        Spacer(flex: 1)
      ],
    );
  }
}
