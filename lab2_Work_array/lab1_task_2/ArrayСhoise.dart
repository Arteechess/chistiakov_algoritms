import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('Введите размер массива: ');
  int size = int.parse(stdin.readLineSync()!);

  DateTime startTime = DateTime.now();
  List<dynamic> randomArray = generateRandomArray(size);
  DateTime endTime = DateTime.now();

  print('Сгенерированный массив: $randomArray');
  print('Время на составление массива: ${endTime.difference(startTime).inMicroseconds} микросекунд.');

  // Засекаем время перед сортировкой массива
  startTime = DateTime.now();
  sortArraySelection(randomArray);
  endTime = DateTime.now();
  
  print('Отсортированный массив: $randomArray');
  print('Время на сортировку массива методом выбора: ${endTime.difference(startTime).inMicroseconds} микросекунд.');
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

List<dynamic> sortArraySelection(List<dynamic> array) {
  for (int i = 0; i < array.length - 1; i++) {
    int minIndex = i;
    for (int j = i + 1; j < array.length; j++) {
      if (compareTo(array[j], array[minIndex]) < 0) {
        minIndex = j;
      }
    }
    if (minIndex != i) {
      var temp = array[i];
      array[i] = array[minIndex];
      array[minIndex] = temp;
    }
  }
  return array; // Возвращаем отсортированный массив
}

int compareTo(dynamic a, dynamic b) {
  if (a is int && b is int) {
    return a.compareTo(b);
  } else if (a is double && b is double) {
    return a.compareTo(b);
  } else if (a is String && b is String) {
    return a.compareTo(b);
  } else {
    return a.toString().compareTo(b.toString());
  }
}