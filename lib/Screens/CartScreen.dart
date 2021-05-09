import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Widgets/CartItem.dart';
import 'package:shop_app/providers/order_provider.dart';

import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: Text("MY CART"),centerTitle: true,),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index){
              return CartItemView(
                  id: cart.items.values.toList()[index].id,
                price: cart.items.values.toList()[index].price,
                title: cart.items.values.toList()[index].title,
                quantity: cart.items.values.toList()[index].quantity,
                productId: cart.items.keys.toList()[index],
              );
            },
          )),
          SizedBox(height: 10,),
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("TOTAL", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Spacer(),
                  Chip(label: Text("\$ ${cart.totalAmount.toStringAsFixed(2)}", style: TextStyle(color: Theme.of(context).primaryTextTheme.title.color,fontWeight: FontWeight.bold),),backgroundColor: Theme.of(context).primaryColor,),
                  FlatButton(
                      onPressed: (){
                        Provider.of<Orders>(context,listen: false).addOrder(cart.items.values.toList(), cart.totalAmount);
                        cart.clearCart();
                      },
                      textColor: Theme.of(context).primaryColor,
                      child: Text("ORDER NOW")
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
