import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_news/blocs/bloc.top.headlines.dart';
import 'package:hacker_news/models/article/models.article.dart';
import 'package:hacker_news/models/article/response/models.article.response.dart';
import 'package:hacker_news/resources/repository.dart';
import 'package:http/http.dart' as http;

void main() {
  test("article parsing", () {
    const jsonStr = """{
          "by" : "dhouston",
          "descendants" : 71,
          "id" : 8863,
          "kids" : [ 8952, 9224, 8917, 8884, 8887, 8943, 8869, 8958, 9005, 9671, 8940, 9067, 8908, 9055, 8865, 8881, 8872, 8873, 8955, 10403, 8903, 8928, 9125, 8998, 8901, 8902, 8907, 8894, 8878, 8870, 8980, 8934, 8876 ],
          "score" : 111,
          "time" : 1175714200,
          "title" : "My YC app: Dropbox - Throw away your USB drive",
          "type" : "story",
          "url" : "http://www.getdropbox.com/u/2/screencast.html"
        }""";
    //
    expect(parseArticle(json.decode(jsonStr)).title, "dhouston");
  });

  test("http get and parsing", () async {
    String baseUrl = "https://newsapi.org/v2/everything";

    final url="$baseUrl?country=us&apiKey=_apiKey";
    final response = await http.get(Uri( scheme: 'https',
        host:"newsapi.org",path: "/v2/everything"
    ));

    if (response.statusCode == 200) {
      expect(
          ArticleResponse.fromJson(json.decode(response.body))
              .articles
              .first
              .source!
              .id,
          "hacker-news");
    }
  });
}
