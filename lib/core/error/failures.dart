import 'package:equatable/equatable.dart';

abstract class Failture extends Equatable {
  const Failture([List propoties = const <dynamic>[]]) : super();
}

class ServerFailure extends Failture {
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failture {
  @override
  List<Object?> get props => [];
}
