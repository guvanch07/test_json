part of 'user_post_cubit.dart';

abstract class UserPostState extends Equatable {
  const UserPostState();

  @override
  List<Object> get props => [];
}

class UserPostInitial extends UserPostState {}

class UserPostLoading extends UserPostState {}

class UserPostLoaded extends UserPostState {
  final List<PostModel> post;
  // final PostModel listOfEntities;
  const UserPostLoaded({
    required this.post,
    // required this.listOfEntities,
  });
}
