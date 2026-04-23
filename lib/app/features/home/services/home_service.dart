import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oasis/app/features/products/productList/model/product_model.dart';

class HomeStatsModel {
  final int totalStock;
  final int lowStockCount;
  final int categoriesCount;
  final double totalValue;
  final List<ProductModel> lowStockProducts;

  HomeStatsModel({
    required this.totalStock,
    required this.lowStockCount,
    required this.categoriesCount,
    required this.totalValue,
    required this.lowStockProducts,
  });
}

class HomeService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<HomeStatsModel> getHomeStats() {
    return _db.collection('products').snapshots().map((snapshot) {
      final products = snapshot.docs
          .map((doc) => ProductModel.fromMap(doc.id, doc.data()))
          .toList();

      final totalStock = products.fold(0, (sum, p) => sum + p.stock);

      final lowStockProducts =
          products.where((p) => p.stock <= p.minimumStock).toList();

      final totalValue =
          products.fold(0.0, (sum, p) => sum + (p.stock * p.price));

      return HomeStatsModel(
        totalStock: totalStock,
        lowStockCount: lowStockProducts.length,
        categoriesCount: 3, // placeholder por ahora
        totalValue: totalValue,
        lowStockProducts: lowStockProducts,
      );
    });
  }
}