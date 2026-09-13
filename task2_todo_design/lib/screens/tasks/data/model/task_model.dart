class TaskModel {
  final int? id;
  final String title;
  final String description;
  final String? imagePath;
  final String? createdAt;

  TaskModel({
    this.id,
    required this.title,
    required this.description,
    this.imagePath,
    this.createdAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imagePath: json['image_path'],
      createdAt: json['created_at'],
    );
  }
}