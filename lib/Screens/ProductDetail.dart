import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';

import '../Utils/AppColors.dart';

class ProductDetail extends StatelessWidget {

  static const routeName = 'productDetail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final product = Provider.of<Products>(context,listen: false).findProductById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
             height: 300,
             width: double.infinity,
             child: Image.network(product.imageUrl,fit: BoxFit.cover,),
            ),
            SizedBox(height: 10,),
            Text("\$${product.price}",style: TextStyle(color: AppColors.greyColor,fontSize: 20),),
            SizedBox(height: 10,),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text(product.description,style: TextStyle(color: AppColors.greyColor,fontSize: 20),softWrap: true,textAlign: TextAlign.center,)
            ),
          ],
        ),
      ),
    );
  }
}
