import 'package:dartz/dartz.dart';
import 'package:test_skleton/core/error/failures.dart';
import 'package:test_skleton/src/features/list_of_users/domain/entities/list_entities.dart';

abstract class ListOfItemsRepository {
  Future<Either<Failture, ListOfEntities>> getListOfItems();
}
