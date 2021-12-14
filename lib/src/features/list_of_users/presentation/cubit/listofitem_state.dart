part of 'listofitem_cubit.dart';

abstract class ListofitemState extends Equatable {
  const ListofitemState();

  @override
  List<Object> get props => [];
}

class ListofitemInitial extends ListofitemState {}

class ListofitemLoading extends ListofitemState {}

class ListofitemLoaded extends ListofitemState {
  final List<ListOfEntities> list;
  const ListofitemLoaded({
    required this.list,
  });
  @override
  List<Object> get props => [list];
}
