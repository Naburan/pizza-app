import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_app/constants.dart';
import 'package:pizza_app/home/components/add_and_substract.dart';
import 'package:pizza_app/home/components/full_amount.dart';
import 'package:pizza_app/home/components/list_of_chosen_extras.dart';
import 'package:pizza_app/home/components/list_of_pizza_images.dart';
import 'package:pizza_app/home/components/toggle_size_of_pizza.dart';
import 'package:pizza_app/home/components/toppings_list.dart';
import 'package:pizza_app/models/Pizza.dart';
import 'package:pizza_app/models/Topping.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

int currentPage = 0,
    currentToppingPage = (.161251195141521521142025 * 1e6).round(),
    focusedTopping = 0,
    toggleButtonSelected = 1;

PageController pizzaController = PageController(initialPage: 0),
    toppingController = PageController(
        initialPage: currentToppingPage, viewportFraction: 1 / 4);

double lastOffSet = 0;

String title = listOfPizza[currentPage].title.toString();

List<bool> isSelected = [false, true, false];
List<String> pizzaSize = ['S', 'M', 'L'];
List<String> listOfExtras = [];
List<double> listOfExtrasPrice = [];

double pizzaBoardWidth = 250.0,
    pizzaWidth = 230.0,
    pizzaSizePrice = 10,
    pizzaScale = 0.8,
    xAlign = 0;

bool drag = false, smaller = false;

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late AnimationController rotationController;
  late final Animation<double> scaleAnimation;
  late Tween<double> scaleTween;
  late AnimationController scaleController;
  late AnimationController scaleController2;
  late final Animation<double> scaleAnimation2;

  double _opacity = 1.0;

  @override
  void initState() {
    rotationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    scaleController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    scaleTween = Tween(begin: 0.6, end: pizzaScale);
    scaleAnimation = scaleTween.animate(
        CurvedAnimation(parent: scaleController, curve: Curves.bounceInOut))
      ..addListener(() {
        setState(() {});
      });

    scaleController2 =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    scaleAnimation2 = scaleTween.animate(
        CurvedAnimation(parent: scaleController2, curve: Curves.bounceInOut))
      ..addListener(() {
        setState(() {});
      });

    scaleController.forward();
    Future.delayed(Duration(milliseconds: 500), () {
      scaleController2.forward();
    });
    super.initState();
  }

  void setNewPosition() {
    scaleTween.begin = scaleTween.end;
    scaleTween.end = pizzaScale;
    scaleController.reset();
    scaleController2.reset();
    scaleController.forward();

    Future.delayed(Duration(milliseconds: 500), () {
      scaleController2.forward();
    });
  }

  @override
  void dispose() {
    rotationController.dispose();
    scaleController.dispose();
    scaleController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: bgColor,
        shadowColor: Colors.transparent,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedOpacity(
              opacity: _opacity,
              curve: Curves.easeIn,
              duration: Duration(milliseconds: 500),
              child: Text(title,
                  style: GoogleFonts.openSans(
                      color: bodyTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 28)),
            ),
            Text(listOfPizza[currentPage].description.toString(),
                style: TextStyle(color: bodyTextColor, fontSize: 15)),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border_outlined),
            tooltip: 'Add To Favourite!',
          ),
        ],
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Stack(
                        fit: StackFit.loose,
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 300,
                          ),
                          Container(
                            child: RotationTransition(
                              turns: Tween(begin: 0.0, end: 0.2)
                                  .animate(this.rotationController),
                              child: Transform.scale(
                                scale: scaleAnimation2.value,
                                child: Image(
                                  image: AssetImage(
                                      "assets/images/wooden_board.png"),
                                  width: 260,
                                ),
                              ),
                            ),
                          ),
                          ListOfPizzaImages(
                            scaleController: scaleController,
                            scaleAnimation: scaleAnimation,
                            rotationController: rotationController,
                            onPageChanged: (index) => setState(
                              () {
                                currentPage = index;
                                title =
                                    listOfPizza[currentPage].title.toString();
                                drag = false;
                              },
                            ),
                            dragUpdate: (details) {
                              setState(
                                () {
                                  if (details.delta.dx > 0) {
                                    pizzaController.previousPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeIn);

                                    if (currentPage != 0) {
                                      rotationController.forward(from: 0.0);
                                      drag = true;
                                    }
                                  }

                                  if (details.delta.dx < 0) {
                                    pizzaController.nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeIn);

                                    if (currentPage != listOfPizza.length - 1) {
                                      rotationController.forward(from: 0.0);
                                      drag = true;
                                    }
                                  }
                                },
                              );
                            },
                          ),
                          AddandSubstract(),
                        ],
                      ),
                    ),
                    FullAmount(),
                    ToggleSizeOfPizza(
                      callback: (val) => setState(
                        () {
                          if (val == 0) {
                            pizzaSizePrice = 5;
                            xAlign = -1;
                            pizzaScale = 0.7;
                            setNewPosition();
                          } else if (val == 2) {
                            pizzaSizePrice = 15;
                            xAlign = 1;
                            pizzaScale = 1;
                            setNewPosition();
                          } else {
                            pizzaSizePrice = 10;
                            xAlign = 0;
                            pizzaScale = 0.8;
                            setNewPosition();
                          }
                        },
                      ),
                    ),
                    ListOfChosenExtras(),
                    ToppingsList(
                      dragUpdate: (details) {
                        if (details.delta.dx > 0) {
                          toppingController.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        }
                        if (details.delta.dx < 0) {
                          toppingController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        }
                      },
                      controller: toppingController,
                      onTap: () => setState(() {
                        if (listOfTopping[
                                currentToppingPage % listOfTopping.length]
                            .isSelected) {
                          listOfExtras.remove(listOfTopping[
                                  currentToppingPage % listOfTopping.length]
                              .title
                              .toString());
                          listOfTopping[
                                  currentToppingPage % listOfTopping.length]
                              .isSelected = false;
                        } else {
                          if (listOfExtras.length != 3) {
                            listOfExtras.add(listOfTopping[
                                    currentToppingPage % listOfTopping.length]
                                .title
                                .toString());
                            listOfTopping[
                                    currentToppingPage % listOfTopping.length]
                                .isSelected = true;
                          }
                        }
                      }),
                      onPageChanged: (index) => setState(
                        () {
                          currentToppingPage = index;
                        },
                      ),
                      onItemFocus: (index) => setState(() {
                        focusedTopping = index;
                      }),
                    ),
                    Stack(
                      children: [
                        Divider(
                          color: Colors.brown,
                          height: 45,
                          thickness: 1,
                        ),
                        Center(
                          child: Container(
                            width: 150,
                            child: TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.brown),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.shopping_cart),
                                  Text("Add to Cart"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

double pizzaFullAmount() {
  double amount = 0.0;
  double sumOfExtras = listOfExtrasPrice.length != 0
      ? listOfExtrasPrice.reduce((a, b) => a + b)
      : 0;
  return amount +=
      listOfPizza[currentPage].price + pizzaSizePrice + sumOfExtras.toDouble();
}
