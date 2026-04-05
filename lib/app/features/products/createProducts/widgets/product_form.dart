import 'package:flutter/material.dart';
import '../services/product_service.dart';
import '../services/notification_service.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({super.key});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final ProductService _productService = ProductService();
  final NotificationService _notificationService = NotificationService();

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final stockInitialController = TextEditingController();
  final stockMinController = TextEditingController();
  final priceController = TextEditingController();

  String? selectedCategoryId;
  String? selectedContactId;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _notificationService.onMessage = (message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), duration: Duration(seconds: 3)),
      );
    };
  }

  // Mientras agrego el maestro original
  final List<Map<String, String>> categories = [
    {'id': 'cat1', 'name': 'Electrónica'},
    {'id': 'cat2', 'name': 'Alimentos'},
    {'id': 'cat3', 'name': 'Aseo'},
  ];

  final List<Map<String, String>> contacts = [
    {'id': 'prov1', 'name': 'Proveedor A'},
    {'id': 'prov2', 'name': 'Proveedor B'},
    {'id': 'prov3', 'name': 'Proveedor C'},
  ];

  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      filled: true,
      fillColor: Theme.of(context).colorScheme.surface,
    );
  }

  void saveProduct() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      await _productService.createProduct(
        name: nameController.text,
        price: double.parse(priceController.text),
        categoryId: selectedCategoryId!, // obligatorio
        contactId: selectedContactId,
        openingStock: int.parse(stockInitialController.text),
        minimumStock: int.parse(stockMinController.text),
        remarks: null, // aún no tienes campo en UI
      );

      _notificationService.sendNotification();

      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Producto guardado correctamente')),
      // );

      clearForm();
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void clearForm() {
    nameController.clear();
    stockInitialController.clear();
    stockMinController.clear();
    priceController.clear();

    setState(() {
      selectedCategoryId = null;
      selectedContactId = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    const SizedBox(height: 24);

    return Form(
      key: _formKey,
      child: ListView(
        children: [
          const Text(
            'Crear producto',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 4),

          const Text(
            'Añade un nuevo producto al inventario',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),

          const SizedBox(height: 20),

          TextFormField(
            controller: nameController,
            decoration: inputDecoration('Nombre del producto *'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingrese el nombre del producto';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          DropdownButtonFormField<String>(
            value: selectedCategoryId,
            decoration: inputDecoration('Categoría *'),
            items: categories.map((category) {
              return DropdownMenuItem(
                value: category['id'],
                child: Text(category['name']!),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCategoryId = value;
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Debe seleccionar una categoría';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          TextFormField(
            controller: stockInitialController,
            keyboardType: TextInputType.number,
            decoration: inputDecoration('Stock inicial *'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingrese el stok inicial';
              }
              if (int.tryParse(value) == null) {
                return 'El stock inicial debe ser un número válido';
              }
              if (int.parse(value) < 0) {
                return 'El stock inicial no puede ser negativo';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          TextFormField(
            controller: stockMinController,
            keyboardType: TextInputType.number,
            decoration: inputDecoration('Stock mínimo *'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingrese el stok mínimo';
              }
              if (int.tryParse(value) == null) {
                return 'El stock mínimo debe ser un número válido';
              }
              if (int.parse(value) < 0) {
                return 'El stock mínimo no puede ser negativo';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          TextFormField(
            controller: priceController,
            keyboardType: TextInputType.number,
            decoration: inputDecoration('Precio unitario *'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingrese el precio';
              }
              if (double.tryParse(value) == null) {
                return 'El precio debe ser un número válido';
              }
              if (double.parse(value) <= 0) {
                return 'El precio debe ser mayor a 0';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          DropdownButtonFormField<String>(
            value: selectedContactId,
            decoration: inputDecoration('Asociar contacto'),
            items: contacts.map((contact) {
              return DropdownMenuItem(
                value: contact['id'],
                child: Text(contact['name']!),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedContactId = value;
              });
            },
          ),

          const SizedBox(height: 30),

          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _isLoading ? null : saveProduct,
                  // child: const Text('Guardar'),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Guardar'),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: OutlinedButton(
                  onPressed: clearForm,
                  child: const Text('Cancelar'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
