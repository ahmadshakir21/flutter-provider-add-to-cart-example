import 'package:flutter/cupertino.dart';
import 'package:todo_application/model/item.dart';

class Cart extends ChangeNotifier {
  List<Item> _items = [];
  double _price = 0.0;

  int get count => _items.length;

  double get totalPrice => _price;

  List<Item> get basketItem => _items;

  void addItem(Item item) {
    _items.add(item);
    _price = _price + item.price;
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);
    _price = _price - item.price;
    notifyListeners();
  }
}
