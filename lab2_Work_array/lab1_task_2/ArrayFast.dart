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
 quickSort(randomArray, 0, randomArray.length - 1);
 endTime = DateTime.now();
 
 print('Отсортированный массив: $randomArray');
 print('Время на сортировку массива методом быстрой сортировки: ${endTime.difference(startTime).inMicroseconds} микросекунд.');
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

void quickSort(List<dynamic> array, int low, int high) {
 if (low < high) {
   int pi = partition(array, low, high);
 
   quickSort(array, low, pi - 1);
   quickSort(array, pi + 1, high);
 }
}

int partition(List<dynamic> array, int low, int high) {
 var pivot = array[high];
 int i = (low - 1);
 
 for (int j = low; j < high; j++) {
   if (compareTo(array[j], pivot) <= 0) {
     i++;
     var temp = array[i];
     array[i] = array[j];
     array[j] = temp;
   }
 }
 
 var temp = array[i + 1];
 array[i + 1] = array[high];
 array[high] = temp;
 
 return i + 1;
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