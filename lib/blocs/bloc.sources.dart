import 'package:hacker_news/models/source/response/models.source.response.dart';
import 'package:hacker_news/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
class SourcesBloc{
  final Repository repository= Repository();
  final _sourceFetcher= BehaviorSubject<SourceResponse>();
  Stream<SourceResponse>? get sources=> _sourceFetcher.stream;
  SourcesBloc(){
    fetchSources();
  }

  fetchSources()async{
   SourceResponse? sources= await repository.getSources;
    _sourceFetcher.sink.add(sources!);
  }

  dispose() {
    _sourceFetcher.close();
  }
}
final sourcesBloc = SourcesBloc();