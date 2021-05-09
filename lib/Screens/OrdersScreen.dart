import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Widgets/AppDrawer.dart';
import 'package:shop_app/Widgets/OrderItem.dart';
import 'package:shop_app/providers/order_provider.dart';

class OrdersScreen extends StatelessWidget {

  static const routeName = 'order';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text("MY ORDERS"),centerTitle: true,),
      body: ListView.builder(
        itemCount: orderData.orders == null ? 0 : orderData.orders.length,
        itemBuilder: (context, index){
          return OrderItemView(orderItem: orderData.orders[index]);
        },
      ),
    );
  }
}
