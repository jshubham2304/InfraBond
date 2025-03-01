// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookmarkState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Bond> get bookmarkedBonds => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookmarkStateCopyWith<BookmarkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkStateCopyWith<$Res> {
  factory $BookmarkStateCopyWith(
          BookmarkState value, $Res Function(BookmarkState) then) =
      _$BookmarkStateCopyWithImpl<$Res, BookmarkState>;
  @useResult
  $Res call({bool isLoading, List<Bond> bookmarkedBonds, String? errorMessage});
}

/// @nodoc
class _$BookmarkStateCopyWithImpl<$Res, $Val extends BookmarkState>
    implements $BookmarkStateCopyWith<$Res> {
  _$BookmarkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? bookmarkedBonds = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      bookmarkedBonds: null == bookmarkedBonds
          ? _value.bookmarkedBonds
          : bookmarkedBonds // ignore: cast_nullable_to_non_nullable
              as List<Bond>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookmarkStateImplCopyWith<$Res>
    implements $BookmarkStateCopyWith<$Res> {
  factory _$$BookmarkStateImplCopyWith(
          _$BookmarkStateImpl value, $Res Function(_$BookmarkStateImpl) then) =
      __$$BookmarkStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<Bond> bookmarkedBonds, String? errorMessage});
}

/// @nodoc
class __$$BookmarkStateImplCopyWithImpl<$Res>
    extends _$BookmarkStateCopyWithImpl<$Res, _$BookmarkStateImpl>
    implements _$$BookmarkStateImplCopyWith<$Res> {
  __$$BookmarkStateImplCopyWithImpl(
      _$BookmarkStateImpl _value, $Res Function(_$BookmarkStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? bookmarkedBonds = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$BookmarkStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      bookmarkedBonds: null == bookmarkedBonds
          ? _value._bookmarkedBonds
          : bookmarkedBonds // ignore: cast_nullable_to_non_nullable
              as List<Bond>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BookmarkStateImpl implements _BookmarkState {
  const _$BookmarkStateImpl(
      {this.isLoading = false,
      final List<Bond> bookmarkedBonds = const [],
      this.errorMessage})
      : _bookmarkedBonds = bookmarkedBonds;

  @override
  @JsonKey()
  final bool isLoading;
  final List<Bond> _bookmarkedBonds;
  @override
  @JsonKey()
  List<Bond> get bookmarkedBonds {
    if (_bookmarkedBonds is EqualUnmodifiableListView) return _bookmarkedBonds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookmarkedBonds);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'BookmarkState(isLoading: $isLoading, bookmarkedBonds: $bookmarkedBonds, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._bookmarkedBonds, _bookmarkedBonds) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_bookmarkedBonds), errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarkStateImplCopyWith<_$BookmarkStateImpl> get copyWith =>
      __$$BookmarkStateImplCopyWithImpl<_$BookmarkStateImpl>(this, _$identity);
}

abstract class _BookmarkState implements BookmarkState {
  const factory _BookmarkState(
      {final bool isLoading,
      final List<Bond> bookmarkedBonds,
      final String? errorMessage}) = _$BookmarkStateImpl;

  @override
  bool get isLoading;
  @override
  List<Bond> get bookmarkedBonds;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$BookmarkStateImplCopyWith<_$BookmarkStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
