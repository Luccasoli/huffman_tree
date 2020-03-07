import 'Models/Node.dart';
import 'dart:io';
import 'package:collection/collection.dart';

Map<String, int> countFrequencyEachChar(list) {
  // Construção do Map com uma letra e sua frequência
  var frequency = Map<String, int>();
  list.forEach((item) {
    if (frequency[item] != null) {
      frequency[item] += 1;
    } else {
      frequency[item] = 1;
    }
  });
  return frequency;
}

void main(List<String> args) {
  print('Digite seu nome: ');
  var input = stdin.readLineSync();

  var frequency = countFrequencyEachChar(input.split(''));

  var pq = PriorityQueue<Node>((x, y) => x.frequency - y.frequency);

  frequency.keys.toList().forEach((key) {
    pq.add(Node(char: key, frequency: frequency[key]));
  });

  Node tree;

  while (pq.length > 0) {
    var left, right;
    left = pq.removeFirst();
    if (pq.length > 0) {
      right = pq.removeFirst();
    } else {
      tree = left;
      break;
    }
    var tempRoot = Node(
        left: left, right: right, frequency: left.frequency + right.frequency);
    pq.add(tempRoot);
  }

  tree.print2D(tree);

  print('Tabela de Codificação:');
  frequency.keys.toList().forEach((key) {
    print('$key - ${tree.encode(key)}');
  });
}
