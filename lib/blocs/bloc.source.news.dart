import 'package:hacker_news/models/article/response/models.article.response.dart';
import 'package:hacker_news/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class SourceNewsBloc{
  final Repository repository= Repository();
  final _sourceFetcher= BehaviorSubject<ArticleResponse>();
  Stream<ArticleResponse>? get sourceFeeds=> _sourceFetcher.stream;
  SourceNewsBloc(){
    fetchSourceNews();
  }

  fetchSourceNews({String? id})async{
    ArticleResponse? sources= await repository.getSourceNews(id??'abc-news');
    _sourceFetcher.sink.add(sources!);
  }

  dispose() {
    _sourceFetcher.close();
  }
}
final sourcesNewsBloc = SourceNewsBloc();