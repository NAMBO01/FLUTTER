import 'package:flutter/material.dart';
import 'package:lab7_restapi/product/models/Product.dart';

class productWidget extends StatelessWidget {
  final List<Product> products;
  productWidget({required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          title: Row(
            children: [
              SizedBox(
                width: 100,
                child: ClipRRect(
                  child: Image.network(product.hinh),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.name),
                      Text(product.price),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
