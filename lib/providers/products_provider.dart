import 'package:flutter/cupertino.dart';
import 'package:shop_app/Models/Product.dart';

class Products with ChangeNotifier{
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl: 'https://i.pinimg.com/236x/4e/c9/6e/4ec96e81957609ba76665f865923e7fc.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Yellow Shirt',
      description: 'A Yellow shirt - it is pretty Yellow!',
      price: 29.99,
      imageUrl: 'https://i.pinimg.com/236x/4e/c9/6e/4ec96e81957609ba76665f865923e7fc.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Blue Shirt',
      description: 'A Blue shirt - it is pretty Blue!',
      price: 29.99,
      imageUrl: 'https://i.pinimg.com/236x/4e/c9/6e/4ec96e81957609ba76665f865923e7fc.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Pink Shirt',
      description: 'A Pink shirt - it is pretty Pink!',
      price: 29.99,
      imageUrl: 'https://i.pinimg.com/236x/4e/c9/6e/4ec96e81957609ba76665f865923e7fc.jpg',
    ),
  ];

  // var _showFavOnly = false;

  List<Product> get items{
    // if(_showFavOnly){
    //   return _items.where((element) => element.isFav).toList();
    // }
    return [..._items];
  }

  // void showFavOnly(){
  //   _showFavOnly = true;
  //   notifyListeners();
  // }
  // void showAll(){
  //   _showFavOnly = false;
  //   notifyListeners();
  // }

  List<Product> favProducts(){
    return _items.where((element) => element.isFav).toList();
  }

  Product findProductById(String id){
    return _items.firstWhere((element) => element.id == id);
  }

  void addProduct(){
    // _items.add(value);
    notifyListeners();
  }
}