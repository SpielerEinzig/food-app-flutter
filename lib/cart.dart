import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack_client/flutter_paystack_client.dart';
import 'package:shop_ui/pageList.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  var publicKey = 'pk_test_8cc3cb26890264ab857ff4bf11a5c41fd53010be';

  late String name;
  late String location;
  late String phoneNumber;
  late String _email;
  late String _message;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PaystackClient.initialize(publicKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            child: ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: productCard(
                  price: cartItems[index].price,
                  name: cartItems[index].name,
                  imageUrl: cartItems[index].url,
                  shortDescription: cartItems[index].shortDescription),
            );
          },
        )),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total amount is N$cartTotal',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 12,
            ),
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextField(
                                onChanged: (value) {
                                  //Do something with the user input.
                                  name = value;
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Enter your Name',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepPurple, width: 1.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepPurple, width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                ),
                              ),
                              TextField(
                                onChanged: (value) {
                                  //Do something with the user input.
                                  _email = value;
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Enter your email',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepPurple, width: 1.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepPurple, width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                ),
                              ),
                              TextField(
                                onChanged: (value) {
                                  //Do something with the user input.
                                  location = value;
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Describe the location of order',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepPurple, width: 1.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepPurple, width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                ),
                              ),
                              TextField(
                                onChanged: (value) {
                                  //Do something with the user input.
                                  phoneNumber = value;
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Phone number',
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepPurple, width: 1.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepPurple, width: 2.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                  ),
                                ),
                                keyboardType: TextInputType.phone,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Material(
                                  color: Colors.deepPurple,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30.0)),
                                  elevation: 5.0,
                                  child: MaterialButton(
                                    onPressed: () async {
                                      //Implement functionality.
                                      final charge = Charge()
                                        ..email = _email
                                        ..amount = cartTotal * 100
                                        ..reference =
                                            'ref_${DateTime.now().millisecondsSinceEpoch}';
                                      final res = await PaystackClient.checkout(
                                          context,
                                          charge: charge);

                                      if (res.status) {
                                        _message =
                                            'Charge was successful. Ref: ${res.reference}';
                                        for (var element in cartItems) {
                                          FirebaseFirestore.instance
                                              .collection('placedOrders')
                                              .doc()
                                              .set({
                                            'name': name,
                                            'phoneNumber': phoneNumber,
                                            'address': location,
                                            'email': _email,
                                            'order': element.name,
                                          });
                                        }
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(_message),
                                        ));
                                        setState(() {
                                          cartItems.clear();
                                          cartTotal = 0;
                                        });
                                        Navigator.pop(context);
                                      } else {
                                        _message = 'Failed: ${res.message}';
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(_message),
                                        ));
                                      }
                                    },
                                    minWidth: 200.0,
                                    height: 42.0,
                                    child: const Text(
                                      'Complete Order',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: const Text('Pay Now'))
          ],
        ),
      ),
    );
  }
}
