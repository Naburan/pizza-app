import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_app/constants.dart';
import 'package:pizza_app/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizza Delivery App',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        canvasColor: bgColor,
        textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white)
            .copyWith(
              bodyText1: TextStyle(color: bodyTextColor),
              bodyText2: TextStyle(color: bodyTextColor),
            ),
      ),
      home: HomeScreen(),
    );
  }
}




// for (int index = 0;
//                               index < isSelected.length;
//                               index++) {
//                             if (index == newIndex) {
//                               isSelected[index] = true;
//                               if (index == 0) {
//                                 pizzaSizePrice = 5;
//                               } else if (index == 2) {
//                                 pizzaSizePrice = 15;
//                               } else {
//                                 pizzaSizePrice = 10;
//                               }
//                             } else {
//                               isSelected[index] = false;
//                             }
//                           }


// class MainScreen extends StatelessWidget {
//   const MainScreen({Key? key, required this.children}) : super(key: key);

//   final List<Widget> children;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {},
//           icon: Icon(Icons.arrow_back),
//         ),
//         backgroundColor: bgColor,
//         shadowColor: Colors.transparent,
//         title: Column(
//           children: [
//             Text(listOfPizza[currentPage].title.toString(),
//                 style: TextStyle(color: bodyTextColor)),
//             Text(listOfPizza[currentPage].description.toString(),
//                 style: TextStyle(color: bodyTextColor, fontSize: 12)),
//           ],
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.favorite_border_outlined),
//             tooltip: 'Add To Favourite!',
//           ),
//         ],
//       ),
//       body: Center(
//         child: Container(
//           constraints: BoxConstraints(maxWidth: maxWidth),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Column(
//                   children: [
//                     ...children,
//                     //Footer
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




// ToggleButtons(

//                         children: [
//                           Text('S'),
//                           Text('M'),
//                           Text('L'),
//                         ],
//                         isSelected: isSelected,
//                         fillColor: Colors.yellow,
//                         selectedColor: Colors.black,
//                         color: Colors.grey,
//                         borderRadius: BorderRadius.circular(50),
//                         renderBorder: false,
//                         onPressed: (int newIndex) {
//                           setState(
//                             () {
//                               for (int index = 0;
//                                   index < isSelected.length;
//                                   index++) {
//                                 if (index == newIndex) {
//                                   isSelected[index] = true;
//                                   if (index == 0) {
//                                     pizzaSizePrice = 5;
//                                   } else if (index == 2) {
//                                     pizzaSizePrice = 15;
//                                   } else {
//                                     pizzaSizePrice = 10;
//                                   }
//                                 } else {
//                                   isSelected[index] = false;
//                                 }
//                               }
//                               pizzaSizeFinder();
//                             },
//                           );
//                         },
//                       ),