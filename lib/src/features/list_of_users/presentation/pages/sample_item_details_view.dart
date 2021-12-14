import 'package:flutter/material.dart';

import 'package:test_skleton/core/const/style.dart';
import 'package:test_skleton/src/features/list_of_users/domain/entities/address_model.dart';
import 'package:test_skleton/src/features/list_of_users/domain/entities/company_model.dart';
import 'package:test_skleton/src/features/list_of_users/domain/entities/list_entities.dart';
import 'package:test_skleton/src/features/list_of_users/presentation/widgets/helper.dart';
import 'package:test_skleton/src/features/post/presentation/pages/post_user.dart';
import 'package:test_skleton/src/features/post_alboms/presentation/pages/album_view.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsView extends StatelessWidget {
  static const routeName = '/sample_item';
  const SampleItemDetailsView({
    Key? key,
    required this.index,
    required this.model,
  }) : super(key: key);

  final int index;
  final ListOfEntities model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(model.username),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Hero(
                    transitionOnUserGestures: true,
                    tag: 'logo$index',
                    child: const CircleAvatar(
                      radius: 100,
                      foregroundImage:
                          AssetImage('assets/images/flutter_logo.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                HelperList(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AlbumView.routeName,
                    );
                  },
                  child: const Text(
                    'Album(click me)',
                    style: textStyle,
                  ),
                )),
                HelperList(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PostUsersView(
                        index: index,
                        model: model,
                      );
                    }));
                  },
                  child: const Text(
                    'Posts(click me)',
                    style: textStyle,
                  ),
                )),
                HelperList(
                    child: Text(
                  model.name,
                  style: textStyle,
                )),
                HelperList(
                    child: Text(
                  model.email,
                  style: textStyle,
                )),
                HelperList(
                    child: Text(
                  model.phone,
                  style: textStyle,
                )),
                HelperList(
                    child: Text(
                  model.website,
                  style: textStyle,
                )),
                const HelperList(
                    child: Text(
                  'Company',
                  style: textStyle,
                )),
                HelperList(child: Text(model.company.name)),
                HelperList(child: Text(model.company.bs)),
                HelperList(child: Text(model.company.catchPhrase)),
                const HelperList(
                    child: Text(
                  'Address',
                  style: textStyle,
                )),
                HelperList(child: Text(model.address.city)),
                HelperList(child: Text(model.address.street)),
                HelperList(child: Text(model.address.suite)),
                HelperList(child: Text(model.address.zipcode)),
              ],
            ),
          ),
        ));
  }
}
