import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_skleton/src/features/list_of_users/domain/entities/list_entities.dart';
import 'package:test_skleton/src/features/list_of_users/presentation/cubit/listofitem_cubit.dart';
import 'package:test_skleton/src/features/post/presentation/cubit/user_post_cubit.dart';
import 'package:test_skleton/src/settings/settings_view.dart';

/// Displays a list of SampleItems.
class PostUsersView extends StatelessWidget {
  static const routeName = '/post';

  const PostUsersView({
    Key? key,
    required this.model,
    required this.index,
  }) : super(key: key);

  final ListOfEntities model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
      ),
      body: BlocBuilder<UserPostCubit, UserPostState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is UserPostLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserPostLoaded) {
            return ListView.builder(
              itemCount: state.post.length,
              itemBuilder: (BuildContext context, int index) {
                final item = state.post[index];
                return ListTile(
                    title: Text('post${item.id.toString()}'),
                    subtitle: Text(item.title),
                    onTap: () {});
              },
            );
          } else {
            return const Text('Something is wrong!!!!!!!!!!!');
          }
        },
      ),
    );
  }
}
