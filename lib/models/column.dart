class Column {
  String? color;
  String? name;

  Column({this.color, this.name});

  Column.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['color'] = color;
    data['name'] = name;
    return data;
  }
}
