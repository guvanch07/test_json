part of 'album_user_cubit.dart';

abstract class AlbumUserState extends Equatable {
  const AlbumUserState();

  @override
  List<Object> get props => [];
}

class AlbumUserInitial extends AlbumUserState {}

class AlbumUserLoading extends AlbumUserState {}

class AlbumUserLoaded extends AlbumUserState {
  final List<AlbumModel> albumlist;
  const AlbumUserLoaded({
    required this.albumlist,
  });
}
