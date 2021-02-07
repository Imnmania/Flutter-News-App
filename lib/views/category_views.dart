import 'package:flutter/material.dart';
import 'package:flutter_news_app/helper/category_news.dart';
import 'package:flutter_news_app/models/article_model.dart';
import 'package:flutter_news_app/widgets/blog_tile.dart';

class CategoryView extends StatefulWidget {
  //
  final String categoryName;
  CategoryView({this.categoryName});
  //
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  //
  var articles = new List<ArticleModel>();
  bool _loading = true;

  getCategoryNews() async {
    CategoryNews newsClass = CategoryNews();
    await newsClass.getNews(widget.categoryName);
    articles = newsClass.newsFromArticleModel;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ],
        ),
        actions: [
          Opacity(
            opacity: 0.0,
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Icon(Icons.save),
                onPressed: null,
              ),
            ),
          )
        ],
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
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
