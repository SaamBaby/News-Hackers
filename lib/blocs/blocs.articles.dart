import 'dart:collection';
import 'package:hackers_news/models/article/models.article.dart';
import 'package:hackers_news/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

import '../const.topStories.dart';

class ArticleBloc{
  final repository= Repository();
  final _articleFetcher= PublishSubject<UnmodifiableListView<Article>>();
  Stream<UnmodifiableListView<Article>>? get article=> _articleFetcher.stream;
  ArticleBloc(){
    fetchArticles();
  }

  fetchArticles()async{
   final value= await repository.getAllTopStories();
    final futureArticles =value.map((e) => fetchArticle(e));
   List<Article> articles=await Future.wait(futureArticles);
   _articleFetcher.sink.add(UnmodifiableListView(articles));
  }

  Future<Article>fetchArticle(int id) async{
    Article item= await repository.fetchArticle(id);
    return item;
  }
  dispose() {
    _articleFetcher.close();
  }
}
final articleBloc = ArticleBloc();