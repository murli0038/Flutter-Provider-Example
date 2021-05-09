import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Models/Product.dart';
import 'package:shop_app/Screens/ProductDetail.dart';
import 'package:shop_app/Utils/AppColors.dart';
import '../providers/cart_provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context,listen: false);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.greyColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GridTile(
          child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ProductDetail.routeName,
                    arguments: product.id);
              },
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              )),
          footer: GridTileBar(
            title: Text(
              product.title,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            backgroundColor: AppColors.commonColor,
            leading: Consumer<Product>(
              builder: (context, product, _) => IconButton(
                icon: Icon(
                    product.isFav ? Icons.favorite : Icons.favorite_border),
                onPressed: () {
                  product.toggleFav();
                },
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: (){
                cart.addToCart(product.id, product.price, product.title);
              },
            ),
          ),
        ),
      ),
    );
  }
}
