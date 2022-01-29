class Meeting {
  String? description;
  String? endDate;
  String? id;
  String? local;
  String? startDate;
  String? title;
  int? sessions;
  int? people;

  Meeting({this.description, this.endDate, this.id, this.local, this.sessions, this.startDate, this.title});

  Meeting.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    endDate = json['endDate'];
    id = json['id'];
    local = json['local'];
    startDate = json['startDate'];
    title = json['title'];
    sessions = json['sessions'];
    people = json['people'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['endDate'] = endDate;
    data['id'] = id;
    data['local'] = local;
    data['startDate'] = startDate;
    data['title'] = title;
    data['sessions'] = sessions;
    data['people'] = people;

    return data;
  }
}
