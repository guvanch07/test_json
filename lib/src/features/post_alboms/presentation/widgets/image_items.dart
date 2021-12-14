import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:test_skleton/core/const/style.dart';
import 'package:test_skleton/src/features/list_of_users/presentation/widgets/helper.dart';
import 'package:test_skleton/src/features/post_alboms/domain/entities/alboms_models.dart';

class ImageItem extends StatelessWidget {
  static const routeName = '/image';
  const ImageItem({
    Key? key,
    required this.albumModel,
  }) : super(key: key);
  final AlbumModel albumModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(albumModel.id.toString()),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Image.network(albumModel.url),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: HelperList(
                child: Text(
              albumModel.title,
              style: textStyle,
            )),
          ),
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) => bottomSheet(context));
              },
              icon: const Icon(
                Icons.message,
                size: 40,
              ))
        ],
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(15), bottom: Radius.circular(15))),
    );
  }
}
