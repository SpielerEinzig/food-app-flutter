import 'package:flutter/material.dart';
import 'package:shop_ui/pageList.dart';

class ContinentalDishes extends StatefulWidget {
  static const String pageName = 'Continental';
  const ContinentalDishes({Key? key}) : super(key: key);

  @override
  _ContinentalDishesState createState() => _ContinentalDishesState();
}

class _ContinentalDishesState extends State<ContinentalDishes> {
  List<Dishes> continentalDishes = [
    Dishes(
      name: 'Fried rice and chicken',
      price: 2500,
      url:
          'https://media.istockphoto.com/photos/braised-chicken-in-a-vegetable-tomato-rice-picture-id483037154?k=20&m=483037154&s=612x612&w=0&h=a7C881-1GFzpNaLTjgd1VE6JuBirZa0Wglv-PZvfMsU=',
      shortDescription: 'Braised Chicken in a Tomato and Vegetable Rice',
    ),
    Dishes(
        name: 'Jollof rice',
        price: 1200,
        url:
            'https://media.istockphoto.com/photos/nigerian-jollof-rice-served-with-fried-meat-picture-id1319167604',
        shortDescription: 'Delicious jollof rice with fried meat'),
    Dishes(
        name: 'Spaghetti and meatballs',
        price: 1800,
        url:
            'https://media.istockphoto.com/photos/spaghetty-pasta-with-meatballs-and-tomato-sauce-picture-id510685112?s=612x612',
        shortDescription: 'Spaghetty pasta with meatballs and tomato sauce')
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          child: ListView.builder(
        itemCount: continentalDishes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Added to cart'),
              ));
              cartItems.add(continentalDishes[index]);
              setState(() {
                cartTotal = cartTotal + continentalDishes[index].price;
              });
            },
            child: productCard(
                price: continentalDishes[index].price,
                name: continentalDishes[index].name,
                imageUrl: continentalDishes[index].url,
                shortDescription: continentalDishes[index].shortDescription),
          );
        },
      )),
    );
  }
}
