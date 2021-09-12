import 'package:hacker_news/models/article/response/models.article.response.dart';
import 'package:hacker_news/models/source/response/models.source.response.dart';

import 'article.api.provider.dart';

class Repository {
  final articleApiProvider = ArticleApiProvider();

  Future<ArticleResponse?> get getGeneralHeadlines => articleApiProvider.getGeneralHeadlines();
  Future<SourceResponse?> get getSources => articleApiProvider.getSources();

  Future<ArticleResponse?> getSourceNews(String sourceId) => articleApiProvider.getSourceNews(sourceId);

  Future<ArticleResponse?> get getTopHeadlines => articleApiProvider.getTopHeadlines();

  Future<ArticleResponse?> search(query) => articleApiProvider.search(query);
}
