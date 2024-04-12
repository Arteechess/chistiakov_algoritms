import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('Введите размер массива: ');
  int size = int.parse(stdin.readLineSync()!);

  List<dynamic> randomArray = generateRandomArray(size);
  print('Сгенерированный массив: $randomArray');

  // Поиск элемента
  stdout.write('Введите элемент для поиска: ');
  dynamic searchItem = dynamicInputParsing(stdin.readLineSync());
  searchElementAndMeasureTime(randomArray, searchItem);

  // Вставка элемента
  stdout.write('Введите элемент для вставки: ');
  dynamic insertItem = dynamicInputParsing(stdin.readLineSync());
  insertElementAndMeasureTime(randomArray, insertItem);

  // Удаление элемента
  stdout.write('Введите элемент для удаления: ');
  dynamic deleteItem = dynamicInputParsing(stdin.readLineSync());
  deleteElementAndMeasureTime(randomArray, deleteItem);
}

List<dynamic> generateRandomArray(int size) {
  Random random = Random();
  List<dynamic> array = List.generate(size, (index) {
    var randomType = random.nextInt(3);

    switch (randomType) {
      case 0:
        return random.nextInt(100); // Целочисленное значение от 0 до 99
      case 1:
        return double.parse((random.nextDouble() * 100).toStringAsFixed(2)); // Вещественное значение с двумя знаками после запятой
      case 2:
        var randomAscii = random.nextInt(26) + 97;
        return String.fromCharCode(randomAscii); // Строковое значение
    }
  });

  return array;
}

void searchElementAndMeasureTime(List<dynamic> array, dynamic target) {
  DateTime startTime = DateTime.now();
  bool isFound = searchElement(array, target);
  DateTime endTime = DateTime.now();

  if (isFound) {
    print('Элемент $target найден в массиве.');
  } else {
    print('Такого элемента в массиве нет.');
  }

  print('Время поиска элемента: ${endTime.difference(startTime).inMicroseconds} микросекунд.');
}

void insertElementAndMeasureTime(List<dynamic> array, dynamic element) {
  DateTime startTime = DateTime.now();
  List<dynamic> newArray = List.from(array);
  newArray.add(element);
  DateTime endTime = DateTime.now();

  print('Измененный массив после вставки: $newArray');
  print('Время вставки элемента: ${endTime.difference(startTime).inMicroseconds} микросекунд.');
}

void deleteElementAndMeasureTime(List<dynamic> array, dynamic element) {
  DateTime startTime = DateTime.now();
  List<dynamic> newArray = List.from(array);
  if (!newArray.contains(element)) {
    print('Элемент $element не найден в массиве для удаления.');
  } else {
    newArray.remove(element);
    DateTime endTime = DateTime.now();

    print('Измененный массив после удаления: $newArray');
    print('Время удаления элемента: ${endTime.difference(startTime).inMicroseconds} микросекунд.');
  }
}

bool searchElement(List<dynamic> array, dynamic target) {
  for (var element in array) {
    if (element == target) {
      return true;
    }
  }
  return false;
}

dynamic dynamicInputParsing(String? input) {
  if (input != null) {
    if (double.tryParse(input) != null) {
      return double.parse(input);
    } else if (int.tryParse(input) != null) {
      return int.parse(input);
    } else {
      return input;
    }
  }
  return null;
}
