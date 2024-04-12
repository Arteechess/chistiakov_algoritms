import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('Введите размер массива: ');
  int size = int.parse(stdin.readLineSync()!);

  List<dynamic> randomArray = generateRandomArray(size);
  List<dynamic> duplicatedArray = List.from(randomArray);

  print('Исходный массив:');
  print(randomArray);

  // Измерение времени работы и сортировка методом вставки
  measureAndSort("Сортировка вставками", List.of(duplicatedArray));

  // Измерение времени работы и сортировка методом выбора
  measureAndSort("Сортировка выбором", List.of(duplicatedArray));

  // Измерение времени работы и сортировка методом слияния
  measureMergeSort("Сортировка слиянием", List.of(duplicatedArray));

  // Измерение времени работы и сортировка методом QuickSort
  measureAndSort("QuickSort", List.of(duplicatedArray));
}

List<dynamic> generateRandomArray(int size) {
  Random random = Random();
  List<dynamic> array = List.generate(size, (index) {
    var randomType = random.nextInt(3);

    switch (randomType) {
      case 0:
        return random.nextInt(100);
      case 1:
        return double.parse((random.nextDouble() * 100).toStringAsFixed(2));
      case 2:
        var randomAscii = random.nextInt(26) + 97;
        return String.fromCharCode(randomAscii);
    }
  });

  return array;
}

List<List<dynamic>> duplicateArray(List<dynamic> array, int times) {
  List<List<dynamic>> duplicatedArrays = List.generate(times, (index) => List.from(array));
  return duplicatedArrays;
}

void measureAndSort(String algorithm, List<dynamic> array) {
  print('-----------------------------------');
  print('Сортировка: $algorithm');

  print('Исходный массив:');
  print(array);

  DateTime startTime = DateTime.now();
  sortArray(array, algorithm);
  DateTime endTime = DateTime.now();

  print('Отсортированный массив:');
  print(array);

  print('Время работы $algorithm: ${endTime.difference(startTime).inMicroseconds} микросекунд.');
}

void sortArray(List<dynamic> array, String algorithm) {
  switch (algorithm) {
    case "Сортировка вставками":
      sortArrayInsertion(array);
      break;
    case "Сортировка выбором":
      sortArraySelection(array);
      break;
    case "QuickSort":
      quickSort(array, 0, array.length - 1);
      break;
  }
}

List<dynamic> sortArrayInsertion(List<dynamic> array) {
  // Реализация сортировки вставками
  // ...
  return array;
}

List<dynamic> sortArraySelection(List<dynamic> array) {
  // Реализация сортировки выбором
  // ...
  return array;
}

void measureMergeSort(String algorithm, List<dynamic> array) {
  print('-----------------------------------');
  print('Сортировка: $algorithm');

  print('Исходный массив:');
  print(array);

  DateTime startTime = DateTime.now();
  List<dynamic> sortedArray = mergeSort(List.of(array));
  DateTime endTime = DateTime.now();

  print('Отсортированный массив:');
  print(sortedArray);

  print('Время работы $algorithm: ${endTime.difference(startTime).inMicroseconds} микросекунд.');
}

List<dynamic> mergeSort(List<dynamic> array) {
  // Реализация сортировки слиянием
  // ...
  return array;
}

List<dynamic> quickSort(List<dynamic> array, int low, int high) {
  // Реализация алгоритма QuickSort
  // ...
  return array;
}
