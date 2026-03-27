import 'package:flutter/material.dart';
import 'package:oasis/app/features/products/productList/services/Get_Product_Service.dart';
import 'package:intl/intl.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final GetProductService _productService = GetProductService();

  String? _selectedProductId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gestión de productos')),
      body: StreamBuilder(
        stream: _productService.getProducts(),
        builder: (context, snapshot) {
          //1. Cargando
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          //2. Error
          if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          }

          //3. Sin datos
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay productos'));
          }

          // 4. Datos OK
          final products = snapshot.data!;

          return ListView(
            children: products.map((product) {
              return GestureDetector(
                onTap: () {

                  //Condición para evitar que recargue sobre el que ya está seleccionado.
                  if(_selectedProductId == product.id){
                      return;
                    }

                  setState(() {
                    _selectedProductId = product.id;
                  });
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: _selectedProductId == product.id
                          ? Colors.purple[200]!
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Info del producto
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Precio: \$${NumberFormat('#,##0.00', 'es_CO').format(product.price)}',
                              style: TextStyle(color: Colors.grey[350]),
                            ),
                            product.stock <= product.minimumStock
                                ? Text(
                                    'Stock bajo: ${product.stock} \nStock mínimo: ${product.minimumStock}',
                                    style: TextStyle(color: Colors.red[400]),
                                  )
                                : Text(
                                    'Stock: ${product.stock}',
                                    style: TextStyle(color: Colors.grey[350]),
                                  ),
                          ],
                        ),

                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit_outlined),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete_outline),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
