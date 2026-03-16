import 'package:flutter/material.dart';
import '../widgets/product_form.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(padding: EdgeInsets.all(16), child: ProductForm()),
    );
  }
}
