import 'package:test_skleton/src/features/list_of_users/domain/entities/list_entities.dart';

abstract class ListOfLocalAbstract {
  Future<ListOfEntities> getListOfUsers();
  Future<void> casheListOfUsers(ListOfEntities listOfItemsModel);
}

class ListOfLocalDataSource extends ListOfLocalAbstract {
  @override
  Future<void> casheListOfUsers(ListOfEntities listOfItemsModel) {
    throw UnimplementedError();
  }

  @override
  Future<ListOfEntities> getListOfUsers() {
    throw UnimplementedError();
  }
}
