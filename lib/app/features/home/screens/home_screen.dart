import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    // testWrite();
    testFirestore();
  }

  Future<void> testFirestore() async {
    final snapshot = await db.collection('products').get();

    print("Cantidad de documentos: ${snapshot.docs.length}");

    for (var doc in snapshot.docs) {
      print("ID: ${doc.id}");
      print("DATA: ${doc.data()}");
    }
  }

  // Future<void> testWrite() async {
  //   await db.collection('products').add({
  //     'name': 'TEST DESDE APP',
  //     'price': 123,
  //   });

  //   print("Documento creado desde la app");
  // }

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Home Screen"));
  }
}
