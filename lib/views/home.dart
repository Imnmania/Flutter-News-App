import 'package:flutter/material.dart';
import 'package:flutter_news_app/helper/news.dart';
import 'package:flutter_news_app/models/article_model.dart';
import 'package:flutter_news_app/models/category_model.dart';
import 'package:flutter_news_app/helper/data.dart';
import 'package:flutter_news_app/widgets/blog_tile.dart';
import 'package:flutter_news_app/widgets/category_tile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var categories = new List<CategoryModel>();
  var articles = new List<ArticleModel>();
  bool _loading = true;

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.newsFromArticleModel;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter'),
            Text(
              'News',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            Text(
              'App',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  /// Categories
                  Container(
                    height: 70,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryTile(
                          categoryName: categories[index].categoryName,
                          imageUrl: categories[index].imageUrl,
                        );
                      },
                    ),
                  ),

                  /// News
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return BlogTile(
                          imageUrl: articles[index].urlToImage,
                          title: articles[index].title,
                          description: articles[index].description,
                          url: articles[index].url,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
