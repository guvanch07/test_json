import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_skleton/core/error/exceptions.dart';
import 'package:test_skleton/src/features/list_of_users/data/datasource/remote/remote_ds.dart';
import 'package:test_skleton/src/features/list_of_users/domain/entities/list_entities.dart';

part 'listofitem_state.dart';

class ListofitemCubit extends Cubit<ListofitemState> {
  ListofitemCubit() : super(ListofitemInitial());

  final datasource = ListOfItemsDataSource();

  void getdata() async {
    try {
      emit(ListofitemLoading());
      final List<ListOfEntities> infousers =
          await datasource.getListOfRemoteDataSource();
      emit(ListofitemLoaded(list: infousers));
    } catch (e) {
      throw ServerExceptions();
    }
  }
}
