import 'dart:io';

// Получение списка цифр
List<int?> getDigits(List<String> words) {
  // Словарь цифр
  Map<String, int> digitsByWords = {
    'zero': 0,
    'one': 1,
    'two': 2,
    'three': 3,
    'four': 4,
    'five': 5,
    'six': 6,
    'seven': 7,
    'eight': 8,
    'nine': 9
  };

  // Результирующая коллеция цифр без повторений
  Set<int?> digits = {};

  // Для каждого слова проверяется его соответствие словарю цифр без учета регистра:
  for (var word in words) {
    final lowerCaseWord = word.toLowerCase();

    if (digitsByWords.containsKey(lowerCaseWord)) {
      digits.add(digitsByWords[word.toLowerCase()]);
    }
  }

  return digits.toList();
}

// Вспомогательные утилиты
// - выполнение определения слов-цифр
void executeExercise5() {
  // Ввод данных
  print('');
  print('--- Задание №5 ---');
  print('Введите строку слов:');

  String? words = stdin.readLineSync()!;

  // Вывод результата
  if (words.isNotEmpty) {
    print('');
    print(
        'Введенная строка содержит следующие слова-цифры: ${getDigits(words.trim().split(' '))}');
  } else {
    print('Отсутствуют данные для выполнения определения слов-цифр');
  }
}
