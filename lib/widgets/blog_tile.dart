import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/views/article_views.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String url;

  BlogTile({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
    @required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(imageUrl: imageUrl)),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              description,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(
              blogUrl: url,
            ),
          ),
        );
      },
    );
  }
}
