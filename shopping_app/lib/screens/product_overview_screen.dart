import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import '../widgets/app_drawer.dart';
import 'package:shopping_app/widgets/badge.dart';
import 'package:shopping_app/widgets/products_grid.dart';

enum FilterOption {
  Favorites,
  Forall,
}

class ProductoverviewScreen extends StatefulWidget {
  @override
  _ProductoverviewScreenState createState() => _ProductoverviewScreenState();
}

class _ProductoverviewScreenState extends State<ProductoverviewScreen> {
  var _showOnlyfavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption selectedItem) {
              setState(() {
                if (selectedItem == FilterOption.Favorites) {
                  _showOnlyfavorites = true;
                } else {
                  _showOnlyfavorites = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (ctx) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOption.Favorites,
              ),
              PopupMenuItem(
                child: Text('For all'),
                value: FilterOption.Forall,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
          //
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyfavorites),
    );
  }
}
