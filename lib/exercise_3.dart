import 'dart:io';

// Определение является ли слово числом
List<num?> getNumsByWords(String words) {
  List<num?> nums = [];

  words.split(' ').forEach((word) {
    num? possibleNum = num.tryParse(word);

    if (possibleNum != null) nums.add(possibleNum);
  });

  return nums;
}

// Вспомогательные утилиты
// - выполнение нахождения чисел в строке
void executeExercise3() {
  // Ввод данных
  print('');
  print('--- Задание №3 ---');
  print('Введите строку:');

  String? words = stdin.readLineSync()!;

  // Вывод результата
  if (words.isNotEmpty) {
    print('');
    print('В введенной строке найдены числа: ${getNumsByWords(words)}');
  } else {
    print('Отсутствуют данные для поиска чисел');
  }
}
