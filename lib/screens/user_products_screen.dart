import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/user_product_item.dart';
import '../widgets/app_drawer.dart';
import '../screens/edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user-product-screen';

  Future<void> _refreshProducts(BuildContext context) async{
    await Provider.of<Products>(context).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh:() => _refreshProducts(context),
          
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (_, index) => Column(
              children: <Widget>[
                UserProductItem(
                  productsData.items[index].id,
                  productsData.items[index].title,
                  productsData.items[index].imageUrl,
                ),
                Divider()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
