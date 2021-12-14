import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_skleton/core/error/exceptions.dart';
import 'package:test_skleton/src/features/post_alboms/data/datasource/remote/remote.dart';
import 'package:test_skleton/src/features/post_alboms/domain/entities/alboms_models.dart';

part 'album_user_state.dart';

class AlbumUserCubit extends Cubit<AlbumUserState> {
  AlbumUserCubit() : super(AlbumUserInitial());
  final albumlist = AlbomsDataSource();

  void getalbum() async {
    try {
      emit(AlbumUserLoading());

      final list = await albumlist.getListOfRemoteDataSource();
      emit(AlbumUserLoaded(albumlist: list));
    } catch (e) {
      throw ServerExceptions();
    }
  }
}
