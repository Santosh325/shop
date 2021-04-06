import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/product_provider.dart';
import 'package:shopping_app/widgets/product_item.dart';
import '../models/product.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    final product = productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ProductItem(
        id: product[i].id,
        title: product[i].title,
        imageUrl: product[i].imageUrl,
      ),
      itemCount: product.length,
    );
  }
}
