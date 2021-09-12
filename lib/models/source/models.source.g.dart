// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.source.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Source> _$sourceSerializer = new _$SourceSerializer();

class _$SourceSerializer implements StructuredSerializer<Source> {
  @override
  final Iterable<Type> types = const [Source, _$Source];
  @override
  final String wireName = 'Source';

  @override
  Iterable<Object?> serialize(Serializers serializers, Source object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.country;
    if (value != null) {
      result
        ..add('country')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.language;
    if (value != null) {
      result
        ..add('language')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Source deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SourceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'language':
          result.language = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Source extends Source {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? url;
  @override
  final String? category;
  @override
  final String? country;
  @override
  final String? language;

  factory _$Source([void Function(SourceBuilder)? updates]) =>
      (new SourceBuilder()..update(updates)).build();

  _$Source._(
      {this.id,
      this.name,
      this.description,
      this.url,
      this.category,
      this.country,
      this.language})
      : super._();

  @override
  Source rebuild(void Function(SourceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SourceBuilder toBuilder() => new SourceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Source &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        url == other.url &&
        category == other.category &&
        country == other.country &&
        language == other.language;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), name.hashCode),
                        description.hashCode),
                    url.hashCode),
                category.hashCode),
            country.hashCode),
        language.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Source')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('url', url)
          ..add('category', category)
          ..add('country', country)
          ..add('language', language))
        .toString();
  }
}

class SourceBuilder implements Builder<Source, SourceBuilder> {
  _$Source? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  String? _country;
  String? get country => _$this._country;
  set country(String? country) => _$this._country = country;

  String? _language;
  String? get language => _$this._language;
  set language(String? language) => _$this._language = language;

  SourceBuilder();

  SourceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _url = $v.url;
      _category = $v.category;
      _country = $v.country;
      _language = $v.language;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Source other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Source;
  }

  @override
  void update(void Function(SourceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Source build() {
    final _$result = _$v ??
        new _$Source._(
            id: id,
            name: name,
            description: description,
            url: url,
            category: category,
            country: country,
            language: language);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
