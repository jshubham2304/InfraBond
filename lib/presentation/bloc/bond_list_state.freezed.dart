// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bond_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BondListState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Bond> get bonds =>
      throw _privateConstructorUsedError; // All bonds (unfiltered)
  List<Bond> get filteredBonds =>
      throw _privateConstructorUsedError; // Bonds filtered by search
  String get searchTerm => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BondListStateCopyWith<BondListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BondListStateCopyWith<$Res> {
  factory $BondListStateCopyWith(
          BondListState value, $Res Function(BondListState) then) =
      _$BondListStateCopyWithImpl<$Res, BondListState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<Bond> bonds,
      List<Bond> filteredBonds,
      String searchTerm,
      String? errorMessage});
}

/// @nodoc
class _$BondListStateCopyWithImpl<$Res, $Val extends BondListState>
    implements $BondListStateCopyWith<$Res> {
  _$BondListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? bonds = null,
    Object? filteredBonds = null,
    Object? searchTerm = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      bonds: null == bonds
          ? _value.bonds
          : bonds // ignore: cast_nullable_to_non_nullable
              as List<Bond>,
      filteredBonds: null == filteredBonds
          ? _value.filteredBonds
          : filteredBonds // ignore: cast_nullable_to_non_nullable
              as List<Bond>,
      searchTerm: null == searchTerm
          ? _value.searchTerm
          : searchTerm // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BondListStateImplCopyWith<$Res>
    implements $BondListStateCopyWith<$Res> {
  factory _$$BondListStateImplCopyWith(
          _$BondListStateImpl value, $Res Function(_$BondListStateImpl) then) =
      __$$BondListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<Bond> bonds,
      List<Bond> filteredBonds,
      String searchTerm,
      String? errorMessage});
}

/// @nodoc
class __$$BondListStateImplCopyWithImpl<$Res>
    extends _$BondListStateCopyWithImpl<$Res, _$BondListStateImpl>
    implements _$$BondListStateImplCopyWith<$Res> {
  __$$BondListStateImplCopyWithImpl(
      _$BondListStateImpl _value, $Res Function(_$BondListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? bonds = null,
    Object? filteredBonds = null,
    Object? searchTerm = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$BondListStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      bonds: null == bonds
          ? _value._bonds
          : bonds // ignore: cast_nullable_to_non_nullable
              as List<Bond>,
      filteredBonds: null == filteredBonds
          ? _value._filteredBonds
          : filteredBonds // ignore: cast_nullable_to_non_nullable
              as List<Bond>,
      searchTerm: null == searchTerm
          ? _value.searchTerm
          : searchTerm // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BondListStateImpl implements _BondListState {
  const _$BondListStateImpl(
      {this.isLoading = false,
      final List<Bond> bonds = const [],
      final List<Bond> filteredBonds = const [],
      this.searchTerm = '',
      this.errorMessage})
      : _bonds = bonds,
        _filteredBonds = filteredBonds;

  @override
  @JsonKey()
  final bool isLoading;
  final List<Bond> _bonds;
  @override
  @JsonKey()
  List<Bond> get bonds {
    if (_bonds is EqualUnmodifiableListView) return _bonds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonds);
  }

// All bonds (unfiltered)
  final List<Bond> _filteredBonds;
// All bonds (unfiltered)
  @override
  @JsonKey()
  List<Bond> get filteredBonds {
    if (_filteredBonds is EqualUnmodifiableListView) return _filteredBonds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredBonds);
  }

// Bonds filtered by search
  @override
  @JsonKey()
  final String searchTerm;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'BondListState(isLoading: $isLoading, bonds: $bonds, filteredBonds: $filteredBonds, searchTerm: $searchTerm, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BondListStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._bonds, _bonds) &&
            const DeepCollectionEquality()
                .equals(other._filteredBonds, _filteredBonds) &&
            (identical(other.searchTerm, searchTerm) ||
                other.searchTerm == searchTerm) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_bonds),
      const DeepCollectionEquality().hash(_filteredBonds),
      searchTerm,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BondListStateImplCopyWith<_$BondListStateImpl> get copyWith =>
      __$$BondListStateImplCopyWithImpl<_$BondListStateImpl>(this, _$identity);
}

abstract class _BondListState implements BondListState {
  const factory _BondListState(
      {final bool isLoading,
      final List<Bond> bonds,
      final List<Bond> filteredBonds,
      final String searchTerm,
      final String? errorMessage}) = _$BondListStateImpl;

  @override
  bool get isLoading;
  @override
  List<Bond> get bonds;
  @override // All bonds (unfiltered)
  List<Bond> get filteredBonds;
  @override // Bonds filtered by search
  String get searchTerm;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$BondListStateImplCopyWith<_$BondListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
