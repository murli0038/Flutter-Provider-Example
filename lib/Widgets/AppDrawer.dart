import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/Screens/CartScreen.dart';
import 'package:shop_app/Screens/OrdersScreen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(title: Text("Hello Friend !"),automaticallyImplyLeading: false,),
          Divider(),
          ListTile(
            title: Text("SHOP"),
            leading: Icon(Icons.shop),
            onTap: (){
              Navigator.pushReplacementNamed(context, "/");
            },
          ),
          Divider(),
          ListTile(
            title: Text("ORDERS"),
            leading: Icon(Icons.payment),
            onTap: (){
              Navigator.pushReplacementNamed(context, OrdersScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
