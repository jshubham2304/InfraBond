// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bond_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BondDetailState {
  bool get isLoading => throw _privateConstructorUsedError;
  BondDetail? get bondDetail => throw _privateConstructorUsedError;
  BondDetailTab get activeTab => throw _privateConstructorUsedError;
  BondDetailChartType get chartType => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BondDetailStateCopyWith<BondDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BondDetailStateCopyWith<$Res> {
  factory $BondDetailStateCopyWith(
          BondDetailState value, $Res Function(BondDetailState) then) =
      _$BondDetailStateCopyWithImpl<$Res, BondDetailState>;
  @useResult
  $Res call(
      {bool isLoading,
      BondDetail? bondDetail,
      BondDetailTab activeTab,
      BondDetailChartType chartType,
      String? errorMessage});

  $BondDetailCopyWith<$Res>? get bondDetail;
}

/// @nodoc
class _$BondDetailStateCopyWithImpl<$Res, $Val extends BondDetailState>
    implements $BondDetailStateCopyWith<$Res> {
  _$BondDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? bondDetail = freezed,
    Object? activeTab = null,
    Object? chartType = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      bondDetail: freezed == bondDetail
          ? _value.bondDetail
          : bondDetail // ignore: cast_nullable_to_non_nullable
              as BondDetail?,
      activeTab: null == activeTab
          ? _value.activeTab
          : activeTab // ignore: cast_nullable_to_non_nullable
              as BondDetailTab,
      chartType: null == chartType
          ? _value.chartType
          : chartType // ignore: cast_nullable_to_non_nullable
              as BondDetailChartType,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BondDetailCopyWith<$Res>? get bondDetail {
    if (_value.bondDetail == null) {
      return null;
    }

    return $BondDetailCopyWith<$Res>(_value.bondDetail!, (value) {
      return _then(_value.copyWith(bondDetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BondDetailStateImplCopyWith<$Res>
    implements $BondDetailStateCopyWith<$Res> {
  factory _$$BondDetailStateImplCopyWith(_$BondDetailStateImpl value,
          $Res Function(_$BondDetailStateImpl) then) =
      __$$BondDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      BondDetail? bondDetail,
      BondDetailTab activeTab,
      BondDetailChartType chartType,
      String? errorMessage});

  @override
  $BondDetailCopyWith<$Res>? get bondDetail;
}

/// @nodoc
class __$$BondDetailStateImplCopyWithImpl<$Res>
    extends _$BondDetailStateCopyWithImpl<$Res, _$BondDetailStateImpl>
    implements _$$BondDetailStateImplCopyWith<$Res> {
  __$$BondDetailStateImplCopyWithImpl(
      _$BondDetailStateImpl _value, $Res Function(_$BondDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? bondDetail = freezed,
    Object? activeTab = null,
    Object? chartType = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$BondDetailStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      bondDetail: freezed == bondDetail
          ? _value.bondDetail
          : bondDetail // ignore: cast_nullable_to_non_nullable
              as BondDetail?,
      activeTab: null == activeTab
          ? _value.activeTab
          : activeTab // ignore: cast_nullable_to_non_nullable
              as BondDetailTab,
      chartType: null == chartType
          ? _value.chartType
          : chartType // ignore: cast_nullable_to_non_nullable
              as BondDetailChartType,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BondDetailStateImpl implements _BondDetailState {
  const _$BondDetailStateImpl(
      {this.isLoading = false,
      this.bondDetail,
      this.activeTab = BondDetailTab.analysis,
      this.chartType = BondDetailChartType.revenue,
      this.errorMessage});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final BondDetail? bondDetail;
  @override
  @JsonKey()
  final BondDetailTab activeTab;
  @override
  @JsonKey()
  final BondDetailChartType chartType;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'BondDetailState(isLoading: $isLoading, bondDetail: $bondDetail, activeTab: $activeTab, chartType: $chartType, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BondDetailStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.bondDetail, bondDetail) ||
                other.bondDetail == bondDetail) &&
            (identical(other.activeTab, activeTab) ||
                other.activeTab == activeTab) &&
            (identical(other.chartType, chartType) ||
                other.chartType == chartType) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, bondDetail, activeTab, chartType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BondDetailStateImplCopyWith<_$BondDetailStateImpl> get copyWith =>
      __$$BondDetailStateImplCopyWithImpl<_$BondDetailStateImpl>(
          this, _$identity);
}

abstract class _BondDetailState implements BondDetailState {
  const factory _BondDetailState(
      {final bool isLoading,
      final BondDetail? bondDetail,
      final BondDetailTab activeTab,
      final BondDetailChartType chartType,
      final String? errorMessage}) = _$BondDetailStateImpl;

  @override
  bool get isLoading;
  @override
  BondDetail? get bondDetail;
  @override
  BondDetailTab get activeTab;
  @override
  BondDetailChartType get chartType;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$BondDetailStateImplCopyWith<_$BondDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
