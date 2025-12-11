class TodosModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodosModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodosModel.fromMap(Map<String, dynamic> data) {
    return TodosModel(
      userId: data["userId"],
      id: data["id"],
      title: data["title"],
      completed: data["completed"],
    );
  }
}
