import 'dart:io';
import 'dart:math';

class Point {
  // Координаты точки
  final int x, y, z;

  Point(this.x, this.y, this.z);

  double distanceTo(Point another) => sqrt(
        pow(another.x - x, 2) + pow(another.y - y, 2) + pow(another.z - z, 2),
      );
}

// Вспомогательные утилиты
// - выполнение определения слов-цифр
void executeExercise6() {
  try {
    // Ввод данных
    print('');
    print('--- Задание №6 ---');
    print('Введите координаты точки A:');

    stdout.write('x = ');
    int? xFirst = int.parse(stdin.readLineSync()!);

    stdout.write('y = ');
    int? yFirst = int.parse(stdin.readLineSync()!);

    stdout.write('z = ');
    int zFirst = int.parse(stdin.readLineSync()!);

    final pointFirst = Point(xFirst, yFirst, zFirst);

    print('');
    print('Введите координаты точки B:');
    stdout.write('x = ');
    int? xSecond = int.parse(stdin.readLineSync()!);

    stdout.write('y = ');
    int? ySecond = int.parse(stdin.readLineSync()!);

    stdout.write('z = ');
    int? zSecond = int.parse(stdin.readLineSync()!);

    final pointSecond = Point(xSecond, ySecond, zSecond);

    print('');

    print(
        'Расстояние между точками A($xFirst, $yFirst, $zFirst) и B($xSecond, $ySecond, $zSecond) равно ${pointFirst.distanceTo(pointSecond)}');
  } catch (e) {
    print('Введены несоответствующие требованиям данные');
    print('Пожалуйста, введите координаты двух точек');
  }
}
