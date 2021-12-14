import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_skleton/src/features/list_of_users/domain/entities/list_entities.dart';
import 'package:test_skleton/src/features/list_of_users/presentation/cubit/listofitem_cubit.dart';
import 'package:test_skleton/src/settings/settings_view.dart';

import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: BlocBuilder<ListofitemCubit, ListofitemState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is ListofitemLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ListofitemLoaded) {
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (BuildContext context, int index) {
                final item = state.list[index];
                return ListTile(
                    title: Text(item.name),
                    subtitle: Text(item.username),
                    leading: Hero(
                      transitionOnUserGestures: true,
                      tag: 'logo$index',
                      child: const CircleAvatar(
                        foregroundImage:
                            AssetImage('assets/images/flutter_logo.png'),
                        //! networkimage in api has not images of users
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SampleItemDetailsView(
                          index: index,
                          model: state.list[index],
                        );
                        //!with arguments didnt pass index
                      }));
                    });
              },
            );
          } else {
            return const Text('Something is wrong');
          }
        },
      ),
    );
  }
}
