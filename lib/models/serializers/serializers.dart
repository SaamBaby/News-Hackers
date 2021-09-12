library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:hacker_news/models/article/response/models.article.response.dart';
import 'package:hacker_news/models/source/models.source.dart';
import 'package:hacker_news/models/source/response/models.source.response.dart';
import '../article/models.article.dart';

part 'serializers.g.dart';

@SerializersFor( [
  Article,
  Source,

])

Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

//TODO  try to make this function work so that we can generate serializers
// for list
// T? deserialize<T>(dynamic value) => serializers.deserializeWith(serializers.serializerForType(T), value);
//
// BuiltList<T> deserializeListOf<T>(dynamic value) => BuiltList.from(value.map((value) => deserialize<T>(value)).toList(growable: false));