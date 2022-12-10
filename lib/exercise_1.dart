import 'dart:io';

// Получние:
// - НОД (наибольший общий делитель)
int getGreatestCommonDivisor(int a, int b) {
  if (a < b) permutationInts(a, b);

  return b != 0 ? getGreatestCommonDivisor(b, a % b) : a;
}

// - НОК (наименьшее общее кратное)
dynamic getLeastCommonMultiple(int a, int b) {
  if (a == 0 || b == 0) {
    // Примечание:
    // - дополнительно можно посмотреть в сторону вывода ошибки на основ соответствующего исключения, например:
    ArgumentError(a == 0 ? 0 : b).toString();

    return 'не существует, т.к. деление на ноль невозможно';
  }

  return a ~/ getGreatestCommonDivisor(a, b) * b;
}

// - перечня простых множителей числа
List<int> getPrimeMultipliers(int x) {
  // Определение первого множителя и абсолютного значения числа
  int absX = x;
  int defaultPrime = 1;

  if (x < 0) {
    absX = x.abs();
    defaultPrime = -1;
  }

  // Итоговый перечень множителей, по-умолчанию содержит 1 или -1
  List<int> multipliers = [defaultPrime];

  // Стартовое значение множителя, с которого начинается поиск остальных
  int divider = 2;

  // Формирование списка множителей, пока исходное число не станет равным 1
  while (absX > 1) {
    // Если нет остатка от деления, то:
    while (absX % divider == 0) {
      // - добавление множетиля в список
      multipliers.add(divider);

      // - деление числа на множитель с последующим обновлением значения числа
      absX ~/= divider;
    }

    // Обновление значения делителя, с учетом того, что есть только одно четное число из простых: 2
    divider = (divider == 2) ? divider + 1 : divider + 2;
  }

  return multipliers;
}

// Вспомогательные утилиты
// - перестановка значений переменных между собой
void permutationInts(int a, int b) {
  final temp = a;

  a = b = temp;
}

// - выполнение операций для двух чисел
void executeExercise1() {
  try {
    // Ввод данных
    print('--- Задание №1 ---');
    print('Введите два целых числа');

    // - первое число
    stdout.write('a = ');
    int? a = int.parse(stdin.readLineSync()!);

    // - второе число
    stdout.write('b = ');
    int? b = int.parse(stdin.readLineSync()!);

    // - наибольший общий делитель
    print('');
    print('Для чисел $a и $b:');

    print(
      '- наибольший общий делитель: ${getGreatestCommonDivisor(a, b)}',
    );

    // - наименьшее общее кратное
    print(
      '- наименьшее общее кратное: ${getLeastCommonMultiple(a, b)}',
    );

    print('- множители числа $a: ${getPrimeMultipliers(a)}');

    print('- множители числа $b: ${getPrimeMultipliers(b)}');
  } on FormatException {
    print('Введены несоответствующие требованиям данные');
    print('Пожалуйста, введите два целых числа');
  }
}
