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

  // Сортировка выбором
  sortArraySelection(randomArray);
  print('Отсортированный массив (Сортировка выбором): $randomArray');

  // Сортировка слиянием
  DateTime mergeSortStartTime = DateTime.now();
  List<dynamic> mergeSortedArray = mergeSort(List.from(randomArray));
  DateTime mergeSortEndTime = DateTime.now();

  print('Отсортированный массив (Сортировка слиянием): $mergeSortedArray');
  print('Время на сортировку слиянием: ${mergeSortEndTime.difference(mergeSortStartTime).inMicroseconds} микросекунд.');
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

List<dynamic> merge(List<dynamic> left, List<dynamic> right) {
  List<dynamic> merged = [];
  int leftIndex = 0, rightIndex = 0;

  while (leftIndex < left.length && rightIndex < right.length) {
    if (compareTo(left[leftIndex], right[rightIndex]) <= 0) {
      merged.add(left[leftIndex]);
      leftIndex++;
    } else {
      merged.add(right[rightIndex]);
      rightIndex++;
    }
  }

  while (leftIndex < left.length) {
    merged.add(left[leftIndex]);
    leftIndex++;
  }

  while (rightIndex < right.length) {
    merged.add(right[rightIndex]);
    rightIndex++;
  }

  return merged;
}

List<dynamic> mergeSort(List<dynamic> array) {
  if (array.length <= 1) {
    return array;
  }

  int mid = array.length ~/ 2;
  List<dynamic> left = mergeSort(array.sublist(0, mid));
  List<dynamic> right = mergeSort(array.sublist(mid));

  return merge(left, right);
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
