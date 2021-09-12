import '../models.article.dart';

class ArticleResponse {
  final List<Article> articles;
  final String error;

  ArticleResponse(this.articles, this.error);

  ArticleResponse.fromJson(Map<String, dynamic> json)
      : articles =(json["articles"] as List).map((i) => parseArticle(i))
      .toList(),
        error = "";

  ArticleResponse.withError(String errorValue)
      : articles = [],
        error = errorValue;
}
