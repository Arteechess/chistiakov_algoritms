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
 mergeSort(randomArray, 0, randomArray.length - 1);
 endTime = DateTime.now();
 
 print('Отсортированный массив: $randomArray');
 print('Время на сортировку массива методом сортировки слиянием: ${endTime.difference(startTime).inMicroseconds} микросекунд.');
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

void mergeSort(List<dynamic> array, int left, int right) {
 if (left < right) {
   int middle = (left + right) ~/ 2;
   
   mergeSort(array, left, middle);
   mergeSort(array, middle + 1, right);
   
   merge(array, left, middle, right);
 }
}

void merge(List<dynamic> array, int left, int middle, int right) {
 int n1 = middle - left + 1;
 int n2 = right - middle;
 
 List<dynamic> leftArray = List<dynamic>.generate(n1, (index) => array[left + index]);
 List<dynamic> rightArray = List<dynamic>.generate(n2, (index) => array[middle + 1 + index]);
 
 int i = 0, j = 0, k = left;
 
 while (i < n1 && j < n2) {
   if (compareTo(leftArray[i], rightArray[j]) <= 0) {
     array[k] = leftArray[i];
     i++;
   } else {
     array[k] = rightArray[j];
     j++;
   }
   k++;
 }
 
 while (i < n1) {
   array[k] = leftArray[i];
   i++;
   k++;
 }
 
 while (j < n2) {
   array[k] = rightArray[j];
   j++;
   k++;
 }
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