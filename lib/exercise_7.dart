import 'dart:io';

// Получение модуля числа
double _getAbs(double x) => (x < 0) ? -x : x;

extension on num {
  // Вычисление корня n-ой степени
  num getNrt(int degreeN) {
    // Если число отрицательное и степень корня четная, то:
    if (this < 0 && degreeN % 2 == 0) {
      // - прекращение действия
      throw ArgumentError(
          'Корень четной степени $degreeN из отрицательного числа $this не существует');
    }

    // Точность вычисления корня
    double calculationAccuracy = 0.00001;

    // Начальное предположение корня
    double root = this / degreeN;

    // Значение корня через последовательное деление
    num rootN = this;

    // Поиск корня пока разница вычиcления более заданной точности
    while (_getAbs(root - rootN) >= calculationAccuracy) {
      rootN = this;

      for (int i = 1; i < degreeN; i++) {
        rootN /= root;
      }

      root = 0.5 * (rootN + root);
    }

    return root;
  }
}

// Вспомогательные утилиты
// - выполнение нахождения для числа корня спепени N
void executeExercise7() {
  try {
    // Ввод данных
    print('');
    print('--- Задание №7 ---');
    print('Введите число:');

    stdout.write('a = ');
    double? a = double.parse(stdin.readLineSync()!);

    print('');
    print('Введите степень вычисляемого корня:');

    stdout.write('n = ');
    int? n = int.parse(stdin.readLineSync()!);

    if (n <= 0) throw ArgumentError();

    // Вывод результата
    print('Для числа $a корень степени $n равен ${a.getNrt(n)}');
  } on ArgumentError {
    print('Значение степени вычисляемого корня должно быть больше нуля');
  } catch (e) {
    print('Введены несоответствующие требованиям данные');
    print('Пожалуйста, введите два числа');
  }
}
