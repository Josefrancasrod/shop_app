import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:shopapp/providers/api_url.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void _setFavValue(bool newValue){
      isFavorite = newValue;
      notifyListeners();
  }

  Future<void> toggleFavoriteStatus(String token, String userId) async {
    final oldStatus = isFavorite;
    final url = ApiUrl(id: id, userId: userId,).firebaseUrlFavorite + '?auth=$token';
    isFavorite = !isFavorite;
    notifyListeners();
    try {

      final response = await http.put(
        url,
        body: json.encode(
          isFavorite,
        ),
      );
      if(response.statusCode >= 400){
        _setFavValue(oldStatus);
      }
    } catch (error) {

        _setFavValue(oldStatus);
    }
  }
}
