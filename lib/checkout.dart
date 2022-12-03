import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/model/cart.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Checkout"),
        ),
        body: Consumer<Cart>(
          builder: (context, value, child) => ListView.builder(
            itemCount: value.basketItem.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                    title: Text(value.basketItem[index].name),
                    trailing: IconButton(
                      onPressed: () {
                        value.removeItem(value.basketItem[index]);
                      },
                      icon: const Icon(Icons.remove),
                    )),
              );
            },
          ),
        ));
  }
}
