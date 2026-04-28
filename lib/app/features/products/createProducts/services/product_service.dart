import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class ProductService {
  // final FirebaseFirestore _db = FirebaseFirestore.instance;

  final String _baseUrl = 'http://localhost:5214/api/products';

  Future<void> createProduct({
    required String name,
    required double price,
    required String categoryId,
    String? contactId,
    required int openingStock,
    required int minimumStock,
    String? remarks,
    required int currentStock
  }) async {
    final body = {
      'name': name,
      'price': price,
      'categoryId': categoryId,
      'contactId': contactId ?? '',
      'openingStock': openingStock,
      'minimumStock': minimumStock,
      'currentStock': currentStock,
    };

    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {'Content-type': 'application/json'},
      body: jsonEncode(body),
    );

    if(response.statusCode != 200){
      throw Exception('Error al crear producto ${response.body}');
    }
  }
}
