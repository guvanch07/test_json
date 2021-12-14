import 'dart:convert';

import 'package:test_skleton/core/const/api_key.dart';
import 'package:test_skleton/src/features/list_of_users/domain/entities/list_entities.dart';
import 'package:http/http.dart' as http;

//! i also can be fetch with package dio but i didint want additional packages

abstract class ListOfItemsAbstract {
  Future<List<ListOfEntities>> getListOfRemoteDataSource();
}

class ListOfItemsDataSource extends ListOfItemsAbstract {
  @override
  Future<List<ListOfEntities>> getListOfRemoteDataSource() async {
    String apiUrl = '/users';
    http.Response response = await http.get(Uri.parse(baseUrl + apiUrl));
    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);

        return list.map((e) => ListOfEntities.fromJson(e)).toList();
      } else {
        return <ListOfEntities>[];
      }
    } catch (e) {
      return <ListOfEntities>[];
    }
  }
}
