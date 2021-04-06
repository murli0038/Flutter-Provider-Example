import 'package:flutter/foundation.dart';
import 'package:shop_app/Models/CartItem.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items;

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addToCart(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      //change quantity
      _items.update(productId, (value) => CartItem(id: value.id, title: value.title, quantity: value.quantity + 1, price: value.price));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: price));
    }
  }
}
