import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final int id;
  final int userId;
  final String title;
  final String body;

  const PostModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'],
      title: json['title'],
      id: json['id'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'title': title,
      'id': id,
      'body': body,
    };
  }

  @override
  List<Object?> get props => [
        userId,
        id,
        title,
        body,
      ];
}
