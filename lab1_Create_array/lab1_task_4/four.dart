import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('Введите размер массива: ');
  int size = int.parse(stdin.readLineSync()!);

  List<int> sortedArray = generateSortedArray(size);
  print('Упорядоченный массив: $sortedArray');


  stdout.write('Введите элемент для поиска: ');
  int searchItem = int.parse(stdin.readLineSync()!); // Поиск элемента
  searchElement(sortedArray, searchItem);

  stdout.write('Введите элемент для двоичного поиска: ');
  int binarySearchItem = int.parse(stdin.readLineSync()!);   // Двоичный поиск элемента
  binarySearchElement(sortedArray, binarySearchItem);

  stdout.write('Введите элемент для вставки: ');
  int insertItem = int.parse(stdin.readLineSync()!); // Вставка элемента
  insertElement(sortedArray, insertItem);

  stdout.write('Введите элемент для удаления: ');
  int deleteItem = int.parse(stdin.readLineSync()!);   // Удаление элемента
  deleteElement(sortedArray, deleteItem);
}

List<int> generateSortedArray(int size) {
  Random random = Random();
  List<int> array = List.generate(size, (index) => random.nextInt(100));

  DateTime startTime = DateTime.now();
  array.sort();
  DateTime endTime = DateTime.now();

  print('Время упорядочивания массива: ${endTime.difference(startTime).inMicroseconds} микросекунд.');
  print('Массив отсортирован методом: Встроенная функция Dart (Timsort)');

  return array;
}

void searchElement(List<int> array, int target) {
  DateTime start = DateTime.now();
  bool isFound = array.contains(target);
  DateTime end = DateTime.now();

  if (isFound) {
    print('Элемент $target найден в массиве.');
  } else {
    print('Такого элемента в массиве нет.');
  }

  print('Время поиска элемента: ${end.difference(start).inMicroseconds} микросекунд.');
}

void binarySearchElement(List<int> array, int target) {
  DateTime start = DateTime.now();
  int result = binarySearch(array, target);
  DateTime end = DateTime.now();

  if (result != -1) {
    print('Элемент $target найден в массиве (индекс: $result).');
  } else {
    print('Такого элемента в массиве нет.');
  }

  print('Время двоичного поиска элемента: ${end.difference(start).inMicroseconds} микросекунд.');
}

int binarySearch(List<int> array, int target) {
  int min = 0;
  int max = array.length - 1;

  while (min <= max) {
    int mid = min + ((max - min) ~/ 2);
    int element = array[mid];

    if (element == target) {
      return mid;
    } else if (element < target) {
      min = mid + 1;
    } else {
      max = mid - 1;
    }
  }

  return -1;
}

void insertElement(List<int> array, int element) {
  DateTime start = DateTime.now();
  array.add(element);
  array.sort();
  DateTime end = DateTime.now();

  print('Измененный массив после вставки: $array');
  print('Время вставки элемента: ${end.difference(start).inMicroseconds} микросекунд.');
}

void deleteElement(List<int> array, int element) {
  DateTime start = DateTime.now();
  array.remove(element);
  DateTime end = DateTime.now();

  print('Измененный массив после удаления: $array');
  print('Время удаления элемента: ${end.difference(start).inMicroseconds} микросекунд.');
}
