import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/checkout.dart';
import 'package:todo_application/model/cart.dart';
import 'package:todo_application/model/item.dart';

class HomeScreen extends StatelessWidget {
  List<Item> items = [
    Item(name: "abc pro20", price: 400),
    Item(name: "abc ultra", price: 320),
    Item(name: "abc pro50", price: 950),
    Item(name: "ttt pg20", price: 730)
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Home"), actions: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Checkout(),
                  ));
                },
                icon: const Icon(Icons.add_shopping_cart_rounded)),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Consumer<Cart>(
                builder: (context, value, child) => Text(
                  value.totalPrice.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        )
      ]),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: Consumer<Cart>(
              builder: (context, value, child) => ListTile(
                title: Text(items[index].name),
                trailing: IconButton(
                    onPressed: () {
                      value.addItem(items[index]);
                    },
                    icon: const Icon(Icons.add_box_rounded)),
              ),
            ),
          );
        },
      ),
    ));
  }
}
