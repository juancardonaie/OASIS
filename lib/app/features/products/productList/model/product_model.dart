class ProductModel {
  final String id;
  final String name;
  final double price;
  final int stock;
  final String category;
  final int minimumStock;

  ProductModel({
    required this.id, 
    required this.name, 
    required this.price, 
    required this.stock, 
    required this.category,
    required this.minimumStock
  });


  factory ProductModel.fromMap(String id, Map<String, dynamic> data){
    return ProductModel(
      id: id,
      name: data['name'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      stock: data['currentStock'] ?? 0,
      category: data['category'] ?? '',
      minimumStock: data['minimumStock'] ?? 0
    );
  }

}