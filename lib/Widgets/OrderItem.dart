import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/Models/OrderItem.dart';

class OrderItemView extends StatefulWidget {

  final OrderItem orderItem;
  OrderItemView({@required this.orderItem});

  @override
  _OrderItemViewState createState() => _OrderItemViewState();
}

class _OrderItemViewState extends State<OrderItemView> {

  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text("\$${widget.orderItem.amount}"),
            subtitle: Text(DateFormat("dd/MM/yyyy hh:mm").format(widget.orderItem.dateTime)),
            trailing: IconButton(icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),onPressed: (){
              setState(() {
                _expanded = !_expanded;
              });
            },),
          ),
          if(_expanded) Container(
            // margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
            height: min(widget.orderItem.products.length * 20.0 + 50, 180),
            child: ListView(
              padding: EdgeInsets.all(5),
              children: widget.orderItem.products.map((element) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(element.title,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
                      Text("${element.quantity} x \$ ${element.price}",style: TextStyle(fontSize: 18, color: Colors.grey),),
                    ],
                  ),
                  Divider()
                ],
              )).toList(),
            ),
          )
        ],
      ),
    );
  }
}
