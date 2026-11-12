import 'package:basic_statefull/shopping/product_model.dart';
import 'package:basic_statefull/shopping/shopping_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WedgitCartCustom extends StatelessWidget {
  ProductModel products;
  WedgitCartCustom({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final objectprovider = context.read<ShoppingProvider>();
    return Padding(
      padding: EdgeInsetsGeometry.all(3),

      child: Card(
        shadowColor: Colors.black54,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(30),
            side: BorderSide(color: Colors.teal),
          ),
          splashColor: Colors.blue,
          title: Text("${products.name}"),
          subtitle: Text("${products.price}"),
          leading: Icon(products.productIcon),
          trailing: Row(
            mainAxisSize: .min,
            children: [
              IconButton(
                onPressed: () {
                  objectprovider.addToCart(products);
                },
                icon: Icon(Icons.add),
              ),
              Text("${products.countity}"),
              IconButton(
                onPressed: () {
                  objectprovider.removeFromCart(products);
                },
                icon: Icon(Icons.remove),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
