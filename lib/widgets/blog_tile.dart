import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  BlogTile({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          CachedNetworkImage(imageUrl: imageUrl),
          Text(title),
          Text(description),
        ],
      ),
    );
  }
}
