class New {
  final int id;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime? updatedAt;

  New(this.id, this.title, this.description, this.createdAt, this.updatedAt);

  factory New.fromJson(Map map) {
    return New(map['id'], map['title'], map['description'], DateTime.now(),
        map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null);
  }

  Map toJson() {
    return {'id': id, 'title': title, 'description': description};
  }

  @override
  String toString() {
    return "News(id=$id,title=$title,description=$description)";
  }
}
