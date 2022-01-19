import 'package:flutter/material.dart';
import 'package:shop_ui/pageList.dart';

class SnackDishes extends StatefulWidget {
  static const String pageName = 'Snacks';
  const SnackDishes({Key? key}) : super(key: key);

  @override
  _SnackDishesState createState() => _SnackDishesState();
}

class _SnackDishesState extends State<SnackDishes> {
  List<Dishes> snackDishes = [
    Dishes(
        name: 'Pizza',
        price: 5500,
        url:
            'https://media.istockphoto.com/photos/small-pizza-with-chicken-spinach-and-double-cheese-picture-id180817243?k=20&m=180817243&s=612x612&w=0&h=Xp95XYtm3t9LmT-_BgyDBWCYKuauJJ0eZHWHzIK-g2k=',
        shortDescription:
            'pizza with white meat chicken, spinach, cheddar and mozerella cheese'),
    Dishes(
        name: 'Double cheese burger',
        price: 2500,
        url:
            'https://media.istockphoto.com/photos/fried-chicken-sandwich-with-cola-picture-id584467794?k=20&m=584467794&s=612x612&w=0&h=B1wwRODHIy4F7YQE_a5UOhOAM0s2MTPzeVYVFOQIKHg=',
        shortDescription:
            'Large double cheese burger with bacon strips and lettuce with free coke'),
    Dishes(
        name: 'Shawarma',
        price: 2000,
        url:
            'https://media.istockphoto.com/photos/beef-souvlaki-wrap-picture-id180698997?s=612x612',
        shortDescription:
            'Beef shawarma with Lettuce, Tomatoes, Red Onions, Feta Cheese, Tzatziki Sauce and a Side of french Fries')
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
          child: ListView.builder(
        itemCount: snackDishes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Added to cart'),
              ));
              cartItems.add(snackDishes[index]);
              setState(() {
                cartTotal = cartTotal + snackDishes[index].price;
              });
            },
            child: productCard(
                name: snackDishes[index].name,
                imageUrl: snackDishes[index].url,
                price: snackDishes[index].price,
                shortDescription: snackDishes[index].shortDescription),
          );
        },
      )),
    );
  }
}
