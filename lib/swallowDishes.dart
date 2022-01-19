import 'package:flutter/material.dart';
import 'package:shop_ui/pageList.dart';

class SwallowDishes extends StatefulWidget {
  static const String pageName = 'Swallow';
  const SwallowDishes({Key? key}) : super(key: key);

  @override
  _SwallowDishesState createState() => _SwallowDishesState();
}

class _SwallowDishesState extends State<SwallowDishes> {
  List<Dishes> swallowDishes = [
    Dishes(
        name: 'Fufu and egusi',
        price: 800,
        url:
            'https://media.istockphoto.com/photos/egusi-soup-and-pounded-yam-nigerian-cuisine-picture-id498310978?b=1&k=20&m=498310978&s=170667a&w=0&h=IEVdew820zZtb5mHALnNW9pyiNVdcnPbVQbGHAvA5kg=',
        shortDescription: 'Fufu and Egusi soup with meat'),
    Dishes(
        name: 'Catfish pepper soup',
        price: 700,
        url:
            'https://media.istockphoto.com/photos/spicy-fried-catfish-with-finger-root-and-chili-in-curry-picture-id1280335968?s=612x612',
        shortDescription: 'Spicy pepper shoup ish garnished with catfish')
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          child: ListView.builder(
        itemCount: swallowDishes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Added to cart'),
              ));
              cartItems.add(swallowDishes[index]);
              setState(() {
                cartTotal = cartTotal + swallowDishes[index].price;
              });
            },
            child: productCard(
                price: swallowDishes[index].price,
                name: swallowDishes[index].name,
                imageUrl: swallowDishes[index].url,
                shortDescription: swallowDishes[index].shortDescription),
          );
        },
      )),
    );
  }
}
