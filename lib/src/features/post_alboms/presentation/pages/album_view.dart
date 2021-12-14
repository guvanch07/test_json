import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_skleton/src/features/post_alboms/presentation/cubit/album_user_cubit.dart';
import 'package:test_skleton/src/features/post_alboms/presentation/widgets/grid_item.dart';

class AlbumView extends StatelessWidget {
  const AlbumView({
    Key? key,
  }) : super(key: key);
  static const routeName = '/album';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocBuilder<AlbumUserCubit, AlbumUserState>(
        builder: (context, state) {
          if (state is AlbumUserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AlbumUserLoaded) {
            return GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.albumlist.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 160 / 180,
                    crossAxisSpacing: 5),
                itemBuilder: (BuildContext context, int index) {
                  return GridItem(
                    albumModel: state.albumlist[index],
                  );
                });
          } else {
            return const Text('error');
          }
        },
      ),
    );
  }
}
