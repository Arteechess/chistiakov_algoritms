import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('Введите размер массива: ');
  int size = int.parse(stdin.readLineSync()!);

  DateTime startTime = DateTime.now(); // Засекаем время перед генерацией массива
  List<dynamic> randomArray = generateRandomArray(size);
  DateTime endTime = DateTime.now(); // Засекаем время после генерации массива

  print('Сгенерированный массив: $randomArray');
  print('Время на составление массива: ${endTime.difference(startTime).inMicroseconds} микросекунд.');
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
        return String.fromCharCode(randomAscii);
    }
  });

  return array;
}
