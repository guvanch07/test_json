import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_skleton/core/error/exceptions.dart';
import 'package:test_skleton/src/features/list_of_users/domain/entities/list_entities.dart';
import 'package:test_skleton/src/features/post/data/datasource/remote/remote_datasource.dart';
import 'package:test_skleton/src/features/post/domain/entities/post_model.dart';

part 'user_post_state.dart';

class UserPostCubit extends Cubit<UserPostState> {
  UserPostCubit() : super(UserPostInitial());

  final postlist = PostDataSource();

  void getpost() async {
    try {
      final ListOfEntities model;
      emit(UserPostLoading());
      final list = await postlist.getPostRemoteDataSource();
      emit(UserPostLoaded(
        post: list,
      ));
    } catch (e) {
      throw ServerExceptions();
    }
  }
}
