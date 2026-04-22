import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oasis/app/features/products/productList/model/product_model.dart';

class GetProductService {
  final _db = FirebaseFirestore.instance;

  Stream<List<ProductModel>> getProducts() {
    return _db.collection('products').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ProductModel.fromMap(doc.id, doc.data());
      }).toList();
    });
  }
}
