import 'package:sb2/exercise_1.dart';
import 'package:test/test.dart';

void main() {
  group('НОД', () {
    test('Первое число меньше второго', () {
      expect(getGreatestCommonDivisor(1, 2), 1);
    });

    test('Первое число больше второго', () {
      expect(getGreatestCommonDivisor(200, 110), 10);
    });

    test('Первое число равно второму', () {
      expect(getGreatestCommonDivisor(13, 13), 13);
    });

    test('Первое число равно нулю', () {
      expect(getGreatestCommonDivisor(0, 2), 2);
    });

    test('Второе число равно нулю', () {
      expect(getGreatestCommonDivisor(2, 0), 2);
    });

    test('Оба числа равны нулю', () {
      expect(getGreatestCommonDivisor(0, 0), 0);
    });
  });

  group('НОК', () {
    test('Одно из чисел равно единице', () {
      expect(getLeastCommonMultiple(1, 200), 200);
    });

    test('Одно из чисел равно нулю', () {
      expect(
        getLeastCommonMultiple(0, 666),
        'не существует, т.к. деление на ноль невозможно',
      );
    });

    test('Оба числа простые', () {
      expect(getLeastCommonMultiple(11, 13), 143);
    });

    test('Одно из чисел множитель для второго', () {
      expect(getLeastCommonMultiple(11, 121), 121);
    });

    test('Оба числа имеют общий множитель', () {
      expect(getLeastCommonMultiple(26, 39), 78);
    });
  });

  group('Перечень простых множителей', () {
    test('Положительное простое число', () {
      expect(getPrimeMultipliers(7), [1, 7]);
    });

    test('Положительное числе с несколькими множителями', () {
      expect(getPrimeMultipliers(35), [1, 5, 7]);
    });

    test('Отрицательное число', () {
      expect(getPrimeMultipliers(-22), [-1, 2, 11]);
    });

    test('Ноль', () {
      expect(getPrimeMultipliers(0), [1]);
    });
  });
}
