import 'Models/Node.dart';
import 'dart:io';
import 'package:collection/collection.dart';

void main(List<String> args) {
  print('Digite seu nome: ');
  var input = stdin.readLineSync();

  var frequency = Map<String, int>();

  // Construção do Map com uma letra e sua frequência
  input.split('').forEach((item) {
    if (frequency[item] != null) {
      frequency[item] += 1;
    } else {
      frequency[item] = 1;
    }
  });

  var pq = PriorityQueue<Node>((x, y) => x.frequency - y.frequency);

  frequency.keys.toList().forEach((key) {
    pq.add(Node(char: key, frequency: frequency[key]));
  });

  print(frequency);
  print(pq.toList().map((item) => item.toJson()));
}
