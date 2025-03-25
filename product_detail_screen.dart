import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(product.thumbnail, width: 200),
            ),
            SizedBox(height: 10),
            Text("Title: ${product.title}", style: TextStyle(fontSize: 18)),
            Text("Description: ${product.description}"),
            Text("Price: ${product.price}"),
            Text("Discount: ${product.discountPercentage}%"),
            Text("Rating: ${product.rating}"),
            Text("Stock: ${product.stock}"),
            Text("Brand: ${product.brand}"),
          ],
        ),
      ),
    );
  }
}
