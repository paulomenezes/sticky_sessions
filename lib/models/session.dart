import 'dart:convert';

import 'package:sticky_sessions/models/column.dart' as session_column;

class Session {
  String? id;
  String? meetingId;
  String? name;
  String? description;
  List<session_column.Column>? columns;
  String? highlight;
  int? answer;

  Session({this.columns, this.description, this.highlight, this.id, this.meetingId, this.name, this.answer});

  Session.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    meetingId = json['meetingId'];
    name = json['name'];
    description = json['description'];
    highlight = json['highlight'];
    answer = json['answer'];

    if (json['columns'] != null) {
      columns = <session_column.Column>[];

      (json['columns'] is String ? jsonDecode(json['columns']) : json['columns']).forEach((v) {
        columns!.add(session_column.Column.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['highlight'] = highlight;
    data['id'] = id;
    data['meetingId'] = meetingId;
    data['name'] = name;
    data['answer'] = answer;

    if (columns != null) {
      data['columns'] = jsonEncode(columns!.map((v) => v.toJson()).toList());
    }

    return data;
  }
}
