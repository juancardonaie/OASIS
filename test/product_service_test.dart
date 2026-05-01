import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validaciones básicas de producto', () {

    test('Nombre no debe estar vacío', () {
      String name = '';

      bool isValid = name.isNotEmpty;

      expect(isValid, false);
    });

    test('Precio debe ser mayor a 0', () {
      double price = 10;

      expect(price > 0, true);
    });

  });
}