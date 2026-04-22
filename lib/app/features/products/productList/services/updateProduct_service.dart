import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateProductService {
  final _db = FirebaseFirestore.instance;

  Future<void> updateProduct({
    required String productId,
    required String name,
    required double price,
    required String categoryId,
    required int minimumStock,
  }) async {
    await _db.collection('products').doc(productId).update({
      'name': name,
      'price': price,
      'categoryId': categoryId,
      'minimumStock': minimumStock,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }
}