import 'dart:convert';

import 'package:hacker_news/models/article/response/models.article.response.dart';
import 'package:hacker_news/models/source/response/models.source.response.dart';
import 'package:http/http.dart' as http;

class ArticleApiProvider {
  static String baseUrl = "https://newsapi.org/v2/";
  static String everythingUrl = "${baseUrl}everything";
  static String topHeadLineUrl = "${baseUrl}top-headlines";
  static String sourcesUrl = "${baseUrl}sources";
  final String _apiKey = "f668e2e0713d467ca58c8ab7f66695ac";

  Future<SourceResponse?> getSources() async {
    final url = "$sourcesUrl?country=us&language=en&apiKey=$_apiKey";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        return SourceResponse.fromJson(result);
      }
    } catch (e) {
      return SourceResponse.withError(e.toString());
    }
  }

  Future<ArticleResponse?> getSourceNews(String sourceId) async {
    final url = "$topHeadLineUrl?sources=$sourceId&apiKey=$_apiKey";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        return ArticleResponse.fromJson(result);
      }
    } catch (e) {
      return ArticleResponse.withError(e.toString());
    }
  }

  Future<ArticleResponse?> getGeneralHeadlines() async {

    final url = "$topHeadLineUrl?language=en&sortBy=popularity&category=general&apiKey=$_apiKey";
    try {
      final response =
          await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        return ArticleResponse.fromJson(result);
      }
    } catch (e) {
      return ArticleResponse.withError(e.toString());
    }
  }

  Future<ArticleResponse?> search(String query) async {

    final url = "$everythingUrl?q=$query&language=en&sortBy=publishedAt&apiKey=$_apiKey";
    try {
      final response =
          await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        return ArticleResponse.fromJson(result);
      }
    } catch (e) {
      return ArticleResponse.withError(e.toString());
    }
  }

  Future<ArticleResponse?> getTopHeadlines() async {
    try {
      final url = "$topHeadLineUrl?country=us&language=en&sortBy=popularity&apiKey=$_apiKey";
      final response = await http.get(Uri.parse(url));
      print(response.statusCode);
      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        return ArticleResponse.fromJson(result);
      }
    } catch (e) {
      return ArticleResponse.withError(e.toString());
    }
  }
}
