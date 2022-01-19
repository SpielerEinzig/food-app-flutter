import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_ui/continentalDishes.dart';
import 'package:shop_ui/snackDishes.dart';
import 'package:shop_ui/swallowDishes.dart';

class PageList {
  String pageName;
  Widget pageDirectory;
  PageList({required this.pageDirectory, required this.pageName});
}

class Dishes {
  String name;
  String url;
  String shortDescription;
  int price;
  Dishes({
    required this.name,
    required this.price,
    required this.url,
    required this.shortDescription,
  });
}

List<PageList> listedPages = [
  PageList(
    pageDirectory: const ContinentalDishes(),
    pageName: ContinentalDishes.pageName,
  ),
  PageList(
    pageDirectory: const SwallowDishes(),
    pageName: SwallowDishes.pageName,
  ),
  PageList(
    pageDirectory: const SnackDishes(),
    pageName: SnackDishes.pageName,
  ),
];

List<Dishes> cartItems = [];
int cartTotal = 0;

Widget productCard({
  required int price,
  required String name,
  required String imageUrl,
  required String shortDescription,
}) {
  return Card(
    child: ListTile(
      leading: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.deepPurple,
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
        ),
      ),
      title: Text(name),
      subtitle: Text(shortDescription),
      trailing: Text(price.toString()),
    ),
  );
}
