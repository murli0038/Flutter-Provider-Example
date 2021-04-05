import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Screens/ProductDetail.dart';
import 'package:shop_app/Screens/ProductOverview.dart';
import 'package:shop_app/Utils/AppColors.dart';
import 'package:shop_app/providers/products_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: AppColors.commonColor,
        ),
        home: ProductOverview(),
        routes: {
          ProductDetail.routeName : (context) => ProductDetail(),
        },
      ),
    );
  }
}