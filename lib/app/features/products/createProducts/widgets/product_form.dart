import 'package:flutter/material.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({super.key});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final stockInitialController = TextEditingController();
  final stockMinController = TextEditingController();
  final priceController = TextEditingController();

  String? selectedCategory;
  String? selectedContact;

  final List<String> categories = ['Electrónica', 'Alimentos', 'Aseo'];
  final List<String> contacts = ['Proveedor A', 'Proveedor B', 'Proveedor C'];

  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      filled: true,
      fillColor: Theme.of(context).colorScheme.surface,
    );
  }

  void saveProduct() {
    if (!_formKey.currentState!.validate()) return;

    final product = {
      "name": nameController.text,
      "category": selectedCategory,
      "initialStock": stockInitialController.text,
      "minStock": stockMinController.text,
      "price": priceController.text,
      "contact": selectedContact,
    };

    print(product);
  }

  void clearForm() {
    nameController.clear();
    stockInitialController.clear();
    stockMinController.clear();
    priceController.clear();

    setState(() {
      selectedCategory = null;
      selectedContact = null;
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
            value: selectedCategory,
            decoration: inputDecoration('Categoría *'),
            items: categories.map((category) {
              return DropdownMenuItem(value: category, child: Text(category));
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCategory = value;
              });
            },
          ),

          const SizedBox(height: 16),

          TextFormField(
            controller: stockInitialController,
            keyboardType: TextInputType.number,
            decoration: inputDecoration('Stock inicial *'),
          ),

          const SizedBox(height: 16),

          TextFormField(
            controller: stockMinController,
            keyboardType: TextInputType.number,
            decoration: inputDecoration('Stock mínimo *'),
          ),

          const SizedBox(height: 16),

          TextFormField(
            controller: priceController,
            keyboardType: TextInputType.number,
            decoration: inputDecoration('Precio unitario *'),
          ),

          const SizedBox(height: 16),

          DropdownButtonFormField<String>(
            value: selectedContact,
            decoration: inputDecoration('Asociar contacto *'),
            items: contacts.map((contact) {
              return DropdownMenuItem(value: contact, child: Text(contact));
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedContact = value;
              });
            },
          ),

          const SizedBox(height: 30),

          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: saveProduct,
                  child: const Text('Guardar'),
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
