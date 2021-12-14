import 'dart:convert';

import 'package:test_skleton/core/const/api_key.dart';
import 'package:http/http.dart' as http;
import 'package:test_skleton/src/features/post_alboms/domain/entities/alboms_models.dart';

abstract class AlbomsAbstract {
  Future<List<AlbumModel>> getListOfRemoteDataSource();
}

class AlbomsDataSource extends AlbomsAbstract {
  @override
  Future<List<AlbumModel>> getListOfRemoteDataSource() async {
    String apiUrl = '/photos';
    http.Response response = await http.get(Uri.parse(baseUrl + apiUrl));
    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);

        return list.map((e) => AlbumModel.fromJson(e)).toList();
      } else {
        return <AlbumModel>[];
      }
    } catch (e) {
      return <AlbumModel>[];
    }
  }
}
