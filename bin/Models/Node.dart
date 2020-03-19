import 'dart:io';

const int DISTANCE = 10;

class Node {
  Node left;
  Node right;
  int frequency;
  String char;

  Node({this.left, this.right, this.frequency, this.char});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['left'] = left;
    data['right'] = right;
    data['frequency'] = frequency;
    data['char'] = char;
    return data;
  }

  void _print2DUtil(root, space) {
    if (root == null) return;

    space += DISTANCE;

    _print2DUtil(root.right, space);

    print('');
    for (var i = 0; i < space; i++) {
      stdout.write(' ');
    }
    print([root.frequency, root.char]);

    _print2DUtil(root.left, space);
  }

  void print2D(root) {
    _print2DUtil(root, 0);
  }

  String _encodeUtil(node, char, cod) {
    if (node == null) return '';
    if (node.char == char) return cod;
    if (node.char == null) {
      return '${_encodeUtil(node.left, char, '${cod}0')}${_encodeUtil(node.right, char, '${cod}1')}';
    }
    return '';
  }

  String encode(String char) {
    return '${_encodeUtil(left, char, '0')}${_encodeUtil(right, char, '1')}';
  }

  String decode(List<String> bits) {
    var current = this;
    var response = '';

    for (var i = 0; i < bits.length; i++) {
      if (bits[i] == '0') {
        current = current.left;
      } else {
        current = current.right;
      }

      if (current.char != null) {
        response += current.char;
        current = this;
      }
      ;
    }
    return response;
  }
}
