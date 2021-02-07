import 'dart:convert';

import 'package:flutter_news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class CategoryNews {
  List<ArticleModel> newsFromArticleModel = [];

  Future<void> getNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=912d1d613be84c7498e3216308ae3895";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            // publishedAt: element["publishedAt"],
            content: element["content"],
          );
          newsFromArticleModel.add(articleModel);
        }
      });
    }
  }
}
