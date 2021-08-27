class Pizza {
  final String? title, description, image;
  final int price;

  Pizza({this.title, this.description, this.image, this.price = 0});
}

List<Pizza> listOfPizza = [
  Pizza(
    title: "Greek",
    description: "spicy pizza wit mozzarella",
    image: "assets/images/pizza.png",
    price: 10,
  ),
  Pizza(
    title: "Veggie",
    description: "fresh veggies & cheese",
    image: "assets/images/pizza.png",
    price: 12,
  ),
  Pizza(
    title: "Italian",
    description: "tomatosauce & mozarellacheese",
    image: "assets/images/pizza.png",
    price: 8,
  ),
];
