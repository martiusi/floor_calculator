import 'package:floor_calculator/controllers/calculator_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Cálculo', () {
    final controller = CalculatorController();
    controller.setFloorLength('0.6');
    controller.setFloorWidth('0.6');
    controller.setRoomLength('3.22');
    controller.setRoomWidth('2.40');

    final result = controller.calculate();

    test('quantidade de pisos', () {
      expect(result.amountPieces, 24);
    });

    test('quantidade de pisos para o rodapé', () {
      expect(result.amountFooter, 10);
    });

    test('quantidade de pisos totais', () {
      expect(result.amountPiecesAndFooter, 34);
    });

    test('metragem quadrada total sem rodapé', () {
      expect(result.areaWithoutFooter, 8.64);
    });

    test('metragem quadrada total com rodapé', () {
      expect(result.areaWithFooter, 12.24);
    });
  });
}
