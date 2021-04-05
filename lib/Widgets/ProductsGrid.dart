import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Widgets/ProductItem.dart';
import 'package:shop_app/providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {

  final bool showFav;
  ProductsGrid({this.showFav});

  @override
  Widget build(BuildContext context) {

    final productsData = Provider.of<Products>(context);
    final products = showFav ? productsData.favProducts() :productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4
      ),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductItem(),
      )
    );
  }
}