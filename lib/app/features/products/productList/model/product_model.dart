class ProductModel {
  final String id;
  final String name;
  final double price;
  final int stock;
  final String categoryId;
  final int minimumStock;

  ProductModel({
    required this.id, 
    required this.name, 
    required this.price, 
    required this.stock, 
    required this.categoryId,
    required this.minimumStock
  });


  factory ProductModel.fromMap(String id, Map<String, dynamic> data){
    return ProductModel(
      id: id,
      name: data['name'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      stock: data['currentStock'] ?? 0,
      categoryId: data['categoryId'] ?? '',
      minimumStock: data['minimumStock'] ?? 0
    );
  }

}