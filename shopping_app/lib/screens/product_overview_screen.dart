import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/widgets/products_grid.dart';
import '../providers/product_provider.dart';
import 'package:shopping_app/widgets/product_item.dart';
import '../models/product.dart';

class ProductoverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: ProductsGrid(),
    );
  }
}
