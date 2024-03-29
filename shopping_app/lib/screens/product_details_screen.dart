import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_app/providers/product_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  // final String title;
  // ProductDetailsScreen(this.title);
  static const routeName = '/product-detial';
  @override
  Widget build(BuildContext context) {
    // productId will get id from the product_item page
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct =
        Provider.of<ProductProvider>(context, listen: false).getById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              child: Image.network(loadedProduct.imageUrl),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                '\$${loadedProduct.price}',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
