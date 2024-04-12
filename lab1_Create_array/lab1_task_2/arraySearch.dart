import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('Введите размер массива: ');
  int size = int.parse(stdin.readLineSync()!);

  List<dynamic> randomArray = generateRandomArray(size);
  print('Сгенерированный массив: $randomArray');

  stdout.write('Введите элемент для поиска: ');
  dynamic searchItem = dynamicInputParsing(stdin.readLineSync()!);

  DateTime startTime = DateTime.now();
  bool isFound = searchElementDynamic(randomArray, searchItem);
  DateTime endTime = DateTime.now();

  if (isFound) {
    print('Элемент $searchItem найден в массиве.');
  } else {
    print('Такого элемента в массиве нет.');
  }

  print('Время поиска элемента: ${endTime.difference(startTime).inMicroseconds} микросекунд.');
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

bool searchElementDynamic(List<dynamic> array, dynamic target) {
  for (var element in array) {
    if (element == target) {
      return true;
    }
  }
  return false;
}

// Обработка ввода для преобразования в соответствующий тип данных
dynamic dynamicInputParsing(String input) {
  if (double.tryParse(input) != null) {
    return double.parse(input);
  } else if (int.tryParse(input) != null) {
    return int.parse(input);
  } else {
    return input;
  }
}
