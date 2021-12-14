import 'package:equatable/equatable.dart';

class AlbumModel extends Equatable {
  final int id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  const AlbumModel({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      albumId: json['albumId'],
      title: json['title'],
      id: json['id'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'albumId': albumId,
      'title': title,
      'id': id,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  @override
  List<Object?> get props => [
        albumId,
        id,
        title,
        url,
        thumbnailUrl,
      ];
}
