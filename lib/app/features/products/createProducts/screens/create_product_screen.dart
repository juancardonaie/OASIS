import 'package:flutter/material.dart';
import 'package:oasis/app/features/products/productList/model/product_model.dart';
import '../widgets/product_form.dart';

class CreateProductScreen extends StatelessWidget {
  final ProductModel? product;
  const CreateProductScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ProductForm(product: product),
      ),
    );
  }
}
