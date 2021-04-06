import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Widgets/ProductsGrid.dart';
import 'package:shop_app/providers/products_provider.dart';

// ignore: must_be_immutable
class ProductOverview extends StatefulWidget {
  @override
  _ProductOverviewState createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {

  bool _showFavOnly =  false;

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("MY SHOP"),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(child: Text("Favorites"),value: ShowingOptions.Favorites,),
              PopupMenuItem(child: Text("Show All"),value: ShowingOptions.ShowAll,),
            ],
            onSelected: (ShowingOptions option){
             setState(() {
               if(option == ShowingOptions.Favorites){
                 // products.showFavOnly();
                 _showFavOnly = true;
               }else{
                 // products.showAll();
                 _showFavOnly = false;
               }
             });
            },
          )
        ],
      ),
      body: ProductsGrid(showFav: _showFavOnly,),
    );
  }
}

enum ShowingOptions{
  Favorites,
  ShowAll
}
