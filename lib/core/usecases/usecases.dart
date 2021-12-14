import 'package:dartz/dartz.dart';
import 'package:test_skleton/core/error/failures.dart';

abstract class Usecase<Type, Parms> {
  Future<Either<Failture, Type>> call();
}
