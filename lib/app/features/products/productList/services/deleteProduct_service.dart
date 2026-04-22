import 'package:cloud_firestore/cloud_firestore.dart';

class DeleteProductService {
  final _db = FirebaseFirestore.instance;

  Future<void> deleteProduct(String productId) async {
    await _db.collection('products').doc(productId).delete();
  }
}