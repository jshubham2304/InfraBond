// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bond_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BondModel _$BondModelFromJson(Map<String, dynamic> json) {
  return _BondModel.fromJson(json);
}

/// @nodoc
mixin _$BondModel {
  @JsonKey(name: 'isin')
  String get isin => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo')
  String get logo => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating')
  String get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_name')
  String get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'tags')
  List<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BondModelCopyWith<BondModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BondModelCopyWith<$Res> {
  factory $BondModelCopyWith(BondModel value, $Res Function(BondModel) then) =
      _$BondModelCopyWithImpl<$Res, BondModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'isin') String isin,
      @JsonKey(name: 'logo') String logo,
      @JsonKey(name: 'rating') String rating,
      @JsonKey(name: 'company_name') String companyName,
      @JsonKey(name: 'tags') List<String> tags});
}

/// @nodoc
class _$BondModelCopyWithImpl<$Res, $Val extends BondModel>
    implements $BondModelCopyWith<$Res> {
  _$BondModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isin = null,
    Object? logo = null,
    Object? rating = null,
    Object? companyName = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      isin: null == isin
          ? _value.isin
          : isin // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BondModelImplCopyWith<$Res>
    implements $BondModelCopyWith<$Res> {
  factory _$$BondModelImplCopyWith(
          _$BondModelImpl value, $Res Function(_$BondModelImpl) then) =
      __$$BondModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'isin') String isin,
      @JsonKey(name: 'logo') String logo,
      @JsonKey(name: 'rating') String rating,
      @JsonKey(name: 'company_name') String companyName,
      @JsonKey(name: 'tags') List<String> tags});
}

/// @nodoc
class __$$BondModelImplCopyWithImpl<$Res>
    extends _$BondModelCopyWithImpl<$Res, _$BondModelImpl>
    implements _$$BondModelImplCopyWith<$Res> {
  __$$BondModelImplCopyWithImpl(
      _$BondModelImpl _value, $Res Function(_$BondModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isin = null,
    Object? logo = null,
    Object? rating = null,
    Object? companyName = null,
    Object? tags = null,
  }) {
    return _then(_$BondModelImpl(
      isin: null == isin
          ? _value.isin
          : isin // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BondModelImpl extends _BondModel {
  const _$BondModelImpl(
      {@JsonKey(name: 'isin') required this.isin,
      @JsonKey(name: 'logo') required this.logo,
      @JsonKey(name: 'rating') required this.rating,
      @JsonKey(name: 'company_name') required this.companyName,
      @JsonKey(name: 'tags') required final List<String> tags})
      : _tags = tags,
        super._();

  factory _$BondModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BondModelImplFromJson(json);

  @override
  @JsonKey(name: 'isin')
  final String isin;
  @override
  @JsonKey(name: 'logo')
  final String logo;
  @override
  @JsonKey(name: 'rating')
  final String rating;
  @override
  @JsonKey(name: 'company_name')
  final String companyName;
  final List<String> _tags;
  @override
  @JsonKey(name: 'tags')
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'BondModel(isin: $isin, logo: $logo, rating: $rating, companyName: $companyName, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BondModelImpl &&
            (identical(other.isin, isin) || other.isin == isin) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isin, logo, rating, companyName,
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BondModelImplCopyWith<_$BondModelImpl> get copyWith =>
      __$$BondModelImplCopyWithImpl<_$BondModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BondModelImplToJson(
      this,
    );
  }
}

abstract class _BondModel extends BondModel {
  const factory _BondModel(
          {@JsonKey(name: 'isin') required final String isin,
          @JsonKey(name: 'logo') required final String logo,
          @JsonKey(name: 'rating') required final String rating,
          @JsonKey(name: 'company_name') required final String companyName,
          @JsonKey(name: 'tags') required final List<String> tags}) =
      _$BondModelImpl;
  const _BondModel._() : super._();

  factory _BondModel.fromJson(Map<String, dynamic> json) =
      _$BondModelImpl.fromJson;

  @override
  @JsonKey(name: 'isin')
  String get isin;
  @override
  @JsonKey(name: 'logo')
  String get logo;
  @override
  @JsonKey(name: 'rating')
  String get rating;
  @override
  @JsonKey(name: 'company_name')
  String get companyName;
  @override
  @JsonKey(name: 'tags')
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$BondModelImplCopyWith<_$BondModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
