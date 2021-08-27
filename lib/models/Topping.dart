class Topping {
  final String? title, image;
  final int price;
  bool isSelected;

  Topping({this.title, this.image, this.price = 0, this.isSelected = false});
}

List<Topping> listOfTopping = [
  Topping(
    title: "Corn",
    image: "assets/images/corn.png",
    price: 2,
    isSelected: false,
  ),
  Topping(
    title: "Tomato",
    image: "assets/images/tomato.png",
    price: 3,
    isSelected: false,
  ),
  Topping(
    title: "Chamnpignon",
    image: "assets/images/champignon.png",
    price: 2,
    isSelected: false,
  ),
  Topping(
    title: "Onion",
    image: "assets/images/onion.png",
    price: 1,
    isSelected: false,
  ),
  Topping(
    title: "Cheese",
    image: "assets/images/cheese.png",
    price: 4,
    isSelected: false,
  ),
];
