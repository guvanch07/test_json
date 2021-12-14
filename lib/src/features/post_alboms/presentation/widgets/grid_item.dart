import 'package:flutter/material.dart';

import 'package:test_skleton/src/features/post_alboms/domain/entities/alboms_models.dart';
import 'package:test_skleton/src/features/post_alboms/presentation/widgets/image_items.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    Key? key,
    required this.albumModel,
  }) : super(key: key);
  final AlbumModel albumModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ImageItem(
                      albumModel: albumModel,
                    )));
      },
      child: Container(
        width: 160,
        height: 180,
        decoration: const BoxDecoration(
          color: Color(0xFFF0F0F3),
          borderRadius: BorderRadius.all(
            Radius.circular(9.0),
          ),
        ),
        child: Image.network(albumModel.thumbnailUrl),
      ),
    );
  }
}
