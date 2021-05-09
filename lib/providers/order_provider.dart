import 'package:flutter/cupertino.dart';
import 'package:shop_app/Models/OrderItem.dart';

import '../Models/CartItem.dart';

class Orders with ChangeNotifier{
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total){
    _orders.insert(0, OrderItem(id: DateTime.now().toString(), amount: total, dateTime: DateTime.now(), products: cartProducts));
    notifyListeners();
  }
}