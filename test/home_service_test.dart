import 'package:flutter_test/flutter_test.dart';

void main() {

  group('Lógica de productos', () {

    test('Stock no debe ser negativo', () {
      int stock = -1;

      bool isValid = stock >= 0;

      expect(isValid, false);
    });

    test('Producto válido si nombre y precio correctos', () {
      String name = 'Laptop';
      double price = 2000;

      bool isValid = name.isNotEmpty && price > 0;

      expect(isValid, true);
    });

    test('Producto inválido si precio es 0', () {
      double price = 0;

      expect(price > 0, false);
    });

  });

}