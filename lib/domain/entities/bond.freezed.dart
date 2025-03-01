// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bond.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Bond {
  String get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get companyName => throw _privateConstructorUsedError;
  String get rating => throw _privateConstructorUsedError;
  String get logoUrl => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BondCopyWith<Bond> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BondCopyWith<$Res> {
  factory $BondCopyWith(Bond value, $Res Function(Bond) then) =
      _$BondCopyWithImpl<$Res, Bond>;
  @useResult
  $Res call(
      {String id,
      String code,
      String companyName,
      String rating,
      String logoUrl,
      List<String> tags,
      bool isActive});
}

/// @nodoc
class _$BondCopyWithImpl<$Res, $Val extends Bond>
    implements $BondCopyWith<$Res> {
  _$BondCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? companyName = null,
    Object? rating = null,
    Object? logoUrl = null,
    Object? tags = null,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BondImplCopyWith<$Res> implements $BondCopyWith<$Res> {
  factory _$$BondImplCopyWith(
          _$BondImpl value, $Res Function(_$BondImpl) then) =
      __$$BondImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String code,
      String companyName,
      String rating,
      String logoUrl,
      List<String> tags,
      bool isActive});
}

/// @nodoc
class __$$BondImplCopyWithImpl<$Res>
    extends _$BondCopyWithImpl<$Res, _$BondImpl>
    implements _$$BondImplCopyWith<$Res> {
  __$$BondImplCopyWithImpl(_$BondImpl _value, $Res Function(_$BondImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? companyName = null,
    Object? rating = null,
    Object? logoUrl = null,
    Object? tags = null,
    Object? isActive = null,
  }) {
    return _then(_$BondImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BondImpl implements _Bond {
  const _$BondImpl(
      {required this.id,
      required this.code,
      required this.companyName,
      required this.rating,
      required this.logoUrl,
      required final List<String> tags,
      required this.isActive})
      : _tags = tags;

  @override
  final String id;
  @override
  final String code;
  @override
  final String companyName;
  @override
  final String rating;
  @override
  final String logoUrl;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final bool isActive;

  @override
  String toString() {
    return 'Bond(id: $id, code: $code, companyName: $companyName, rating: $rating, logoUrl: $logoUrl, tags: $tags, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BondImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, code, companyName, rating,
      logoUrl, const DeepCollectionEquality().hash(_tags), isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BondImplCopyWith<_$BondImpl> get copyWith =>
      __$$BondImplCopyWithImpl<_$BondImpl>(this, _$identity);
}

abstract class _Bond implements Bond {
  const factory _Bond(
      {required final String id,
      required final String code,
      required final String companyName,
      required final String rating,
      required final String logoUrl,
      required final List<String> tags,
      required final bool isActive}) = _$BondImpl;

  @override
  String get id;
  @override
  String get code;
  @override
  String get companyName;
  @override
  String get rating;
  @override
  String get logoUrl;
  @override
  List<String> get tags;
  @override
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$BondImplCopyWith<_$BondImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
