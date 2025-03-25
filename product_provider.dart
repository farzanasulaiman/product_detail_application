import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    final url = Uri.parse('https://dummyjson.com/products');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> productData = json.decode(response.body)['products'];
      _products = productData.map((json) => Product.fromJson(json)).toList();
      notifyListeners();
    }
  }
}
