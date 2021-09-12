import 'package:hacker_news/models/source/models.source.dart';

class SourceResponse{
  final List<Source> sources;
  final String error;

  SourceResponse(this.sources, this.error);

  SourceResponse.fromJson(Map<String, dynamic> json)
      : sources =
  (json["sources"] as List).map((i) => parseSource(i)).toList(),
        error = "";

  SourceResponse.withError(String errorValue)
      : sources = [],
        error = errorValue;
}
