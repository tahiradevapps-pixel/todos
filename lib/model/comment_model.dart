class CommentModel {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  CommentModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

 factory  CommentModel.fromMap(Map<String, dynamic> data) {
    return CommentModel(
      postId: data["postId"],
      id: data["id"],
      name: data["name"],
      email: data["email"],
      body: data["body"],
    );
  }
}
