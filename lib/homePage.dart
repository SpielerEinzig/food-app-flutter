import 'package:flutter/material.dart';
import 'package:shop_ui/admin_logIn.dart';
import 'package:shop_ui/cart.dart';
import 'package:shop_ui/pageList.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Cart();
            }));
          },
          backgroundColor: Colors.deepPurple,
          elevation: 6,
          child: const Icon(Icons.shopping_cart_sharp),
        ),
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            elevation: 0,
            title: const Text('Order your meal'),
            actions: [
              TextButton(
                child: const Icon(Icons.person),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
              )
            ]),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(
                height: 30,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listedPages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPage = index;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(left: 10),
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                color: index == selectedPage
                                    ? Colors.white.withOpacity(0.4)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(6)),
                            child: Text(
                              listedPages[index].pageName,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 35),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: listedPages[selectedPage].pageDirectory,
                ),
              ),
            ],
          ),
        ));
  }
}
