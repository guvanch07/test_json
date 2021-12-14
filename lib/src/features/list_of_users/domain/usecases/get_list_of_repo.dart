import 'package:dartz/dartz.dart';
import 'package:test_skleton/core/error/failures.dart';
import 'package:test_skleton/src/features/list_of_users/domain/entities/list_entities.dart';
import 'package:test_skleton/src/features/list_of_users/domain/repo/list_repo.dart';

//! it's for testing

class GetListOfItems {
  final ListOfItemsRepository repository;
  GetListOfItems(this.repository);

  Future<Either<Failture, ListOfEntities>> call() async {
    return await repository.getListOfItems();
  }
}
