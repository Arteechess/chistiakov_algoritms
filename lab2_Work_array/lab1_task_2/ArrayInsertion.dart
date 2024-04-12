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

  sortArrayInsertion(randomArray);
  print('Отсортированный массив: $randomArray');
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

// Метод вставки
List<dynamic> sortArrayInsertion(List<dynamic> array) {
  for (int i = 1; i < array.length; i++) {
    var key = array[i];
    int j = i - 1;

    while (j >= 0 && compareTo(array[j], key) > 0) {
      array[j + 1] = array[j];
      j = j - 1;
    }

    array[j + 1] = key;
  }

  return array;
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

