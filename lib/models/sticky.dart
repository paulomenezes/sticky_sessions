class Sticky {
  String? id;
  String? content;
  String? columnName;
  String? userName;
  String? sessionId;

  Sticky({this.columnName, this.content, this.id, this.sessionId, this.userName});

  Sticky.fromJson(Map<String, dynamic> json) {
    columnName = json['columnName'];
    content = json['content'];
    id = json['id'];
    sessionId = json['sessionId'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['columnName'] = columnName;
    data['content'] = content;
    data['id'] = id;
    data['sessionId'] = sessionId;
    data['userName'] = userName;
    return data;
  }
}
