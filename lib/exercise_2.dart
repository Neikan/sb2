// Перевод числа из десятичной системы счисления в двоичную
import 'dart:io';
import 'dart:math';

String convertDecimalToBinary(int decimal) {
  if (decimal == 0) return '0';

  // Конечный двоичный результат
  String binary = '';

  // Пока конвертируемое число не ноль:
  while (decimal != 0) {
    // - добавление остатка от деления - 0 или 1 - в начало двоичного результата
    binary = '${(decimal % 2)}$binary';

    // - деление на цело конвертируемого числа для его уменьшения
    decimal ~/= 2;
  }

  return binary;
}

// Перевод числа из двоичной системы счисления в десятичную
dynamic convertBinaryToDecimal(String binary) {
  // Конечный десятичный результат
  int decimal = 0;

  // Текст возможной ошибки, если строка окажется не двоичным числом
  String errorText = '';

  // Счетчик степени
  int j = 0;

  // Попытка конвертации каждого символа двоичной строки:
  for (int i = binary.length; i > 0; i--) {
    // Если символ эквивалентен 0 или 1, то конвертация
    if ((binary[i - 1] == '1') || (binary[i - 1] == '0')) {
      // - возведение в степень с последующим умножением на 0 или 1
      decimal += pow(2, j).toInt() * int.parse(binary[i - 1]);

      // - увеличение счетчика степени
      j++;
    } else {
      // Примечание:
      // - дополнительно можно посмотреть в сторону вывода ошибки на основ соответствующего исключения, например: ArgumentError(binary);

      errorText = 'Введенные данные не являются двоичным числом';

      break;
    }
  }

  return errorText.isNotEmpty ? errorText : decimal;
}

// Вспомогательные утилиты
// - выполнение конвертаций
void executeExercise2() {
  executeConvertToBinary();
  executeConvertToDecimal();
}

// - конвертация в двоичную
void executeConvertToBinary() {
  // Ввод данных
  print('');
  print('Введите десятичное число');

  stdout.write('a = ');
  int? a = int.tryParse(stdin.readLineSync()!);

  // Если введено число, то конвертация из десятичной в двоичную с выводом результата
  if (a != null) {
    print('');
    print(
      'Число $a в двоичной системе равно: ${convertDecimalToBinary(a)}',
    );
  } else {
    print('Введены несоответствующие требованиям данные');
    print('Пожалуйста, введите десятичное число');
  }
}

// - конвертация в десятичную
void executeConvertToDecimal() {
  // Ввод данных
  print('');
  print('Введите двоичное число');

  stdout.write('b = ');
  String? b = stdin.readLineSync()!;

  // Конвертация из двоичной в десятичную
  final decimalB = convertBinaryToDecimal(b);

  // Определение была ли успешно выполнена конвертация
  if (decimalB is int) {
    print('Число $b в двоичной системе равно');

    print('- $decimalB (используя свой метод)');

    print(
      '- ${int.tryParse(b, radix: 2)} (используя стандартную библиотеку)',
    );
  } else {
    print(decimalB);
  }
}
