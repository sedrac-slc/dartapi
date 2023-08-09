class New {
  final int id;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime? updated;

  New(this.id, this.title, this.description, this.createdAt, this.updated);

  @override
  String toString() {
    return "News(id=$id,title=$title,descrition=$description)";
  }
}
