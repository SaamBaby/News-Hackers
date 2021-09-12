import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers/serializers.dart';

part 'models.source.g.dart';
abstract class Source implements Built<Source, SourceBuilder> {
  static Serializer<Source> get serializer => _$sourceSerializer;
  String? get id;

  String? get name;

  String? get description;

  String? get url;

  String? get category;

  String? get country;

  String? get language;

  Source._();

  factory Source([void Function(SourceBuilder) updates]) = _$Source;
}
Source parseSource(Map<String, dynamic> parsed) {
  Source? source = serializers.deserializeWith(Source.serializer, parsed);
  return source!;
}
