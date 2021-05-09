import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartItemView extends StatelessWidget {

  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  CartItemView({@required this.title,@required this.quantity,@required this.price,@required this.id,@required this.productId});

  @override
  Widget build(BuildContext context) {
    
    double totalAmount = price * quantity;
    
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(Icons.delete,color: Colors.white,),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
      ),
      onDismissed: (direction){
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(backgroundColor: Theme.of(context).primaryColor,child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: FittedBox(child: Text("\$ $price",style: TextStyle(color: Theme.of(context).primaryTextTheme.title.color),)),
            ),),
            title: Text(title),
            subtitle: Text("Total: \$ ${totalAmount.toStringAsFixed(2)}"),
            trailing: Text("$quantity x"),
          ),
        ),
      ),
    );
  }
}
