
import 'package:hacker_news/models/article/response/models.article.response.dart';
import 'package:hacker_news/resources/repository.dart';
import 'package:rxdart/rxdart.dart';


class TopHeadlinesBloc{
  final Repository repository= Repository();
  final _topHeadLinesFetcher= BehaviorSubject<ArticleResponse>();
  Stream<ArticleResponse>? get topHeadLines=> _topHeadLinesFetcher.stream;
  TopHeadlinesBloc(){
    fetchAllArticles();
  }

  fetchAllArticles()async{
    ArticleResponse? topHeadLines= await repository.getTopHeadlines;
   _topHeadLinesFetcher.sink.add(topHeadLines!);
  }

  dispose() {
    _topHeadLinesFetcher.close();
  }
}
final topHeadLinesBloc = TopHeadlinesBloc();