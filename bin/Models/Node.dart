class Node {
  Node left;
  Node right;
  int frequency;
  String char;

  Node({this.left, this.right, this.frequency, this.char});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['left'] = this.left;
    data['right'] = this.right;
    data['frequency'] = this.frequency;
    data['char'] = this.char;
    return data;
  }
}
