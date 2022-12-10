import 'dart:io';

// Подсчет вхождений в коллекцию каждого слова
Map<String, int> countWords(List<String> words) {
  // Слова и их количество в списке
  Map<String, int> wordsByCount = {};

  // Для каждого слова проверяется наличие его в коллекции:
  for (var word in words) {
    // - Если его еще нет там, то:
    if (!wordsByCount.containsKey(word)) {
      // - добавление его туда
      wordsByCount[word] = 1;
    } else {
      // А если есть, то:
      // - увеличение количества его вхождений
      wordsByCount.update(word, (count) => ++count);
    }
  }

  return wordsByCount;
}

// Вспомогательные утилиты
// - выполнение подсчета слов
void executeExercise4() {
  // Ввод данных
  print('');
  print('--- Задание №4 ---');
  // Т.к. слова из кириллицы не могут быть использованы в качестве ключей в Map,
  // то добавлено хотя бы такое предупреждение
  print(
      'Предупреждение: ввод необходимо выполнить без использования кириллицы');
  print('Введите слова через пробел:');

  String? words = stdin.readLineSync()!;

  // Вывод результата
  if (words.isNotEmpty) {
    print('');
    print(countWords(words.trim().split(' ')));
  } else {
    print('Отсутствуют данные для подсчета');
  }
}
