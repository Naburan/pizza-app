import 'package:flutter/material.dart';
import 'package:pizza_app/home/main_screen.dart';

class ListOfChosenExtras extends StatelessWidget {
  const ListOfChosenExtras({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        listOfExtras.length.toString() + "/3",
        style: TextStyle(color: Colors.black54),
      ),
    );
  }
}
