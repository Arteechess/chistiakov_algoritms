import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('Введите размер массива: ');
  int size = int.parse(stdin.readLineSync()!);

  List<int> sortedArray = generateSortedArray(size);
  print('Упорядоченный массив: $sortedArray');
}

List<int> generateSortedArray(int size) {
  Random random = Random();
  List<int> array = List.generate(size, (index) => random.nextInt(100));

  DateTime startTime = DateTime.now();
  array.sort();
  DateTime endTime = DateTime.now();

  print('Время упорядочивания массива: ${endTime.difference(startTime).inMicroseconds} микросекунд.');
  print('Массив отсортирован методом: Встроенная функцией Timsort: ');

  return array;
}
