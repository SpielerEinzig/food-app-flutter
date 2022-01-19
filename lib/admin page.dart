import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text('New orders'),
              ),
              Tab(
                child: Text('Completed orders'),
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          NewOrders(),
          CompletedOrders(),
        ]),
      ),
    );
  }
}

class NewOrders extends StatefulWidget {
  const NewOrders({Key? key}) : super(key: key);

  @override
  _NewOrdersState createState() => _NewOrdersState();
}

class _NewOrdersState extends State<NewOrders> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('placedOrders').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              String order = data["order"];
              String phoneNumber = data["phoneNumber"];
              String name = data["name"];
              String address = data["address"];
              return Card(
                child: ListTile(
                  leading: const FlutterLogo(
                    size: 72.0,
                    textColor: Colors.deepPurple,
                  ),
                  title: Text('$order by $name'),
                  subtitle:
                      Text('Location: $address, phoneNumber: $phoneNumber'),
                  trailing: TextButton(
                      onPressed: () {
                        print(document.id);
                        FirebaseFirestore.instance
                            .collection('completedOrders')
                            .doc()
                            .set({
                          "order": order,
                          "phoneNumber": phoneNumber,
                          "name": name,
                          "address": address,
                        });
                        FirebaseFirestore.instance
                            .collection('placedOrders')
                            .doc(document.id)
                            .delete();
                      },
                      child: const Icon(Icons.check)),
                  isThreeLine: true,
                ),
              );
            }).toList(),
          );
        });
  }
}

class CompletedOrders extends StatefulWidget {
  const CompletedOrders({Key? key}) : super(key: key);

  @override
  _CompletedOrdersState createState() => _CompletedOrdersState();
}

class _CompletedOrdersState extends State<CompletedOrders> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('completedOrders')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              String order = data["order"];
              String phoneNumber = data["phoneNumber"];
              String name = data["name"];
              String address = data["address"];
              return Card(
                child: ListTile(
                  leading: const FlutterLogo(
                    size: 72.0,
                    textColor: Colors.deepPurple,
                  ),
                  title: Text('$order by $name'),
                  subtitle:
                      Text('Location: $address, phoneNumber: $phoneNumber'),
                  trailing: TextButton(
                      onPressed: () {
                        print(document.id);
                        FirebaseFirestore.instance
                            .collection('completedOrders')
                            .doc(document.id)
                            .delete();
                      },
                      child: const Icon(Icons.delete)),
                  isThreeLine: true,
                ),
              );
            }).toList(),
          );
        });
  }
}
