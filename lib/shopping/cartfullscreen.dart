import 'package:basic_statefull/shopping/shopping_cart_screen.dart';
import 'package:basic_statefull/shopping/shopping_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class cartscreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal,
          title: Text(
            "Cart",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Consumer<ShoppingProvider>(
          builder: (context, value, child) => Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) =>
                      WedgitCartCustom(products: value.cart[index]),
                ),
              ),
              Container(
                alignment: .center,
                width: double.infinity,
                height: 75,

                color: Colors.teal,
                child: Text(
                  "\$Price ${value.calculateTotal()}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
