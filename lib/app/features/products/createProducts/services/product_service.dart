import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createProduct({
    required String name,
    required double price,
    required String categoryId,
    String? contactId,
    required int openingStock,
    required int minimumStock,
    String? remarks,
  }) async {
    final data = {
      'name': name,
      'price': price,
      'categoryId': categoryId,
      'openingStock': openingStock,
      'minimumStock': minimumStock,
      'createdAt': FieldValue.serverTimestamp(),
    };

    if (contactId != null) {
      data['contactId'] = contactId;
    }

    if (remarks != null && remarks.isNotEmpty) {
      data['remarks'] = remarks;
    }

    await _db.collection('products').add(data);
  }
}
