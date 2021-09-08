import 'package:hackers_news/models/article/models.article.dart';

import 'article.api.provider.dart';

class Repository{
  final articleApiProvider =ArticleApiProvider();

  Future<List<int>> getAllTopStories()=> articleApiProvider.getAllTopStories();
  Future<Article> fetchArticle(id) => articleApiProvider.getArticle(id);
}