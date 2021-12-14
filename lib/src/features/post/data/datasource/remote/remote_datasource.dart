import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_skleton/core/const/api_key.dart';
import 'package:test_skleton/src/features/post/domain/entities/post_model.dart';

abstract class PostAbstract {
  Future<List<PostModel>> getPostRemoteDataSource();
}

class PostDataSource extends PostAbstract {
  @override
  Future<List<PostModel>> getPostRemoteDataSource() async {
    String apiUrl = '/posts';
    http.Response response = await http.get(Uri.parse(baseUrl + apiUrl));
    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);

        return list.map((e) => PostModel.fromJson(e)).toList();
      } else {
        return <PostModel>[];
      }
    } catch (e) {
      return <PostModel>[];
    }
  }
}
