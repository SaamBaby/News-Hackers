import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hacker_news/models/source/models.source.dart';

import '../serializers/serializers.dart';

part 'models.article.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {
  static Serializer<Article> get serializer => _$articleSerializer;

  Source? get source;
  String? get author;

  String? get title;

  String? get description;

  String? get url;

  String? get urlToImage;

  String? get publishedAt;

  String? get content;


  Article._();

  factory Article([void Function(ArticleBuilder) updates]) = _$Article;
}

Article parseArticle(Map<String, dynamic>  parsed) {

  Article? article = serializers.deserializeWith(Article.serializer, parsed);
  return article!;
}

// List<int> parseTopStories(String jsonStr) {
//   final parsed = json.decode(jsonStr);
//   final listOfIds = List<int>.from(parsed);
//   return listOfIds;
// }
