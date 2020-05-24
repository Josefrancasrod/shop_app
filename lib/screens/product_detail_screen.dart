import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static const productDetailScreenRoute = '/product-detail-screen-route';
  // final String title;

  // ProductDetailScreen(this.title);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
    );
  }
}
