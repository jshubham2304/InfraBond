// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bond_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BondDetailModel _$BondDetailModelFromJson(Map<String, dynamic> json) {
  return _BondDetailModel.fromJson(json);
}

/// @nodoc
mixin _$BondDetailModel {
  @JsonKey(name: 'logo')
  String get logo => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_name')
  String get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'isin')
  String get isin => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'pros_and_cons')
  ProsAndConsModel get prosAndCons => throw _privateConstructorUsedError;
  @JsonKey(name: 'financials')
  FinancialsModel get financials => throw _privateConstructorUsedError;
  @JsonKey(name: 'issuer_details')
  IssuerDetailsModel get issuerDetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BondDetailModelCopyWith<BondDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BondDetailModelCopyWith<$Res> {
  factory $BondDetailModelCopyWith(
          BondDetailModel value, $Res Function(BondDetailModel) then) =
      _$BondDetailModelCopyWithImpl<$Res, BondDetailModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'logo') String logo,
      @JsonKey(name: 'company_name') String companyName,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'isin') String isin,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'pros_and_cons') ProsAndConsModel prosAndCons,
      @JsonKey(name: 'financials') FinancialsModel financials,
      @JsonKey(name: 'issuer_details') IssuerDetailsModel issuerDetails});

  $ProsAndConsModelCopyWith<$Res> get prosAndCons;
  $FinancialsModelCopyWith<$Res> get financials;
  $IssuerDetailsModelCopyWith<$Res> get issuerDetails;
}

/// @nodoc
class _$BondDetailModelCopyWithImpl<$Res, $Val extends BondDetailModel>
    implements $BondDetailModelCopyWith<$Res> {
  _$BondDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logo = null,
    Object? companyName = null,
    Object? description = null,
    Object? isin = null,
    Object? status = null,
    Object? prosAndCons = null,
    Object? financials = null,
    Object? issuerDetails = null,
  }) {
    return _then(_value.copyWith(
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isin: null == isin
          ? _value.isin
          : isin // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      prosAndCons: null == prosAndCons
          ? _value.prosAndCons
          : prosAndCons // ignore: cast_nullable_to_non_nullable
              as ProsAndConsModel,
      financials: null == financials
          ? _value.financials
          : financials // ignore: cast_nullable_to_non_nullable
              as FinancialsModel,
      issuerDetails: null == issuerDetails
          ? _value.issuerDetails
          : issuerDetails // ignore: cast_nullable_to_non_nullable
              as IssuerDetailsModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProsAndConsModelCopyWith<$Res> get prosAndCons {
    return $ProsAndConsModelCopyWith<$Res>(_value.prosAndCons, (value) {
      return _then(_value.copyWith(prosAndCons: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FinancialsModelCopyWith<$Res> get financials {
    return $FinancialsModelCopyWith<$Res>(_value.financials, (value) {
      return _then(_value.copyWith(financials: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $IssuerDetailsModelCopyWith<$Res> get issuerDetails {
    return $IssuerDetailsModelCopyWith<$Res>(_value.issuerDetails, (value) {
      return _then(_value.copyWith(issuerDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BondDetailModelImplCopyWith<$Res>
    implements $BondDetailModelCopyWith<$Res> {
  factory _$$BondDetailModelImplCopyWith(_$BondDetailModelImpl value,
          $Res Function(_$BondDetailModelImpl) then) =
      __$$BondDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'logo') String logo,
      @JsonKey(name: 'company_name') String companyName,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'isin') String isin,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'pros_and_cons') ProsAndConsModel prosAndCons,
      @JsonKey(name: 'financials') FinancialsModel financials,
      @JsonKey(name: 'issuer_details') IssuerDetailsModel issuerDetails});

  @override
  $ProsAndConsModelCopyWith<$Res> get prosAndCons;
  @override
  $FinancialsModelCopyWith<$Res> get financials;
  @override
  $IssuerDetailsModelCopyWith<$Res> get issuerDetails;
}

/// @nodoc
class __$$BondDetailModelImplCopyWithImpl<$Res>
    extends _$BondDetailModelCopyWithImpl<$Res, _$BondDetailModelImpl>
    implements _$$BondDetailModelImplCopyWith<$Res> {
  __$$BondDetailModelImplCopyWithImpl(
      _$BondDetailModelImpl _value, $Res Function(_$BondDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logo = null,
    Object? companyName = null,
    Object? description = null,
    Object? isin = null,
    Object? status = null,
    Object? prosAndCons = null,
    Object? financials = null,
    Object? issuerDetails = null,
  }) {
    return _then(_$BondDetailModelImpl(
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isin: null == isin
          ? _value.isin
          : isin // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      prosAndCons: null == prosAndCons
          ? _value.prosAndCons
          : prosAndCons // ignore: cast_nullable_to_non_nullable
              as ProsAndConsModel,
      financials: null == financials
          ? _value.financials
          : financials // ignore: cast_nullable_to_non_nullable
              as FinancialsModel,
      issuerDetails: null == issuerDetails
          ? _value.issuerDetails
          : issuerDetails // ignore: cast_nullable_to_non_nullable
              as IssuerDetailsModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BondDetailModelImpl extends _BondDetailModel {
  const _$BondDetailModelImpl(
      {@JsonKey(name: 'logo') required this.logo,
      @JsonKey(name: 'company_name') required this.companyName,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'isin') required this.isin,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'pros_and_cons') required this.prosAndCons,
      @JsonKey(name: 'financials') required this.financials,
      @JsonKey(name: 'issuer_details') required this.issuerDetails})
      : super._();

  factory _$BondDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BondDetailModelImplFromJson(json);

  @override
  @JsonKey(name: 'logo')
  final String logo;
  @override
  @JsonKey(name: 'company_name')
  final String companyName;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'isin')
  final String isin;
  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'pros_and_cons')
  final ProsAndConsModel prosAndCons;
  @override
  @JsonKey(name: 'financials')
  final FinancialsModel financials;
  @override
  @JsonKey(name: 'issuer_details')
  final IssuerDetailsModel issuerDetails;

  @override
  String toString() {
    return 'BondDetailModel(logo: $logo, companyName: $companyName, description: $description, isin: $isin, status: $status, prosAndCons: $prosAndCons, financials: $financials, issuerDetails: $issuerDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BondDetailModelImpl &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isin, isin) || other.isin == isin) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.prosAndCons, prosAndCons) ||
                other.prosAndCons == prosAndCons) &&
            (identical(other.financials, financials) ||
                other.financials == financials) &&
            (identical(other.issuerDetails, issuerDetails) ||
                other.issuerDetails == issuerDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, logo, companyName, description,
      isin, status, prosAndCons, financials, issuerDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BondDetailModelImplCopyWith<_$BondDetailModelImpl> get copyWith =>
      __$$BondDetailModelImplCopyWithImpl<_$BondDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BondDetailModelImplToJson(
      this,
    );
  }
}

abstract class _BondDetailModel extends BondDetailModel {
  const factory _BondDetailModel(
      {@JsonKey(name: 'logo') required final String logo,
      @JsonKey(name: 'company_name') required final String companyName,
      @JsonKey(name: 'description') required final String description,
      @JsonKey(name: 'isin') required final String isin,
      @JsonKey(name: 'status') required final String status,
      @JsonKey(name: 'pros_and_cons')
      required final ProsAndConsModel prosAndCons,
      @JsonKey(name: 'financials') required final FinancialsModel financials,
      @JsonKey(name: 'issuer_details')
      required final IssuerDetailsModel issuerDetails}) = _$BondDetailModelImpl;
  const _BondDetailModel._() : super._();

  factory _BondDetailModel.fromJson(Map<String, dynamic> json) =
      _$BondDetailModelImpl.fromJson;

  @override
  @JsonKey(name: 'logo')
  String get logo;
  @override
  @JsonKey(name: 'company_name')
  String get companyName;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'isin')
  String get isin;
  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'pros_and_cons')
  ProsAndConsModel get prosAndCons;
  @override
  @JsonKey(name: 'financials')
  FinancialsModel get financials;
  @override
  @JsonKey(name: 'issuer_details')
  IssuerDetailsModel get issuerDetails;
  @override
  @JsonKey(ignore: true)
  _$$BondDetailModelImplCopyWith<_$BondDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProsAndConsModel _$ProsAndConsModelFromJson(Map<String, dynamic> json) {
  return _ProsAndConsModel.fromJson(json);
}

/// @nodoc
mixin _$ProsAndConsModel {
  @JsonKey(name: 'pros')
  List<String> get pros => throw _privateConstructorUsedError;
  @JsonKey(name: 'cons')
  List<String> get cons => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProsAndConsModelCopyWith<ProsAndConsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProsAndConsModelCopyWith<$Res> {
  factory $ProsAndConsModelCopyWith(
          ProsAndConsModel value, $Res Function(ProsAndConsModel) then) =
      _$ProsAndConsModelCopyWithImpl<$Res, ProsAndConsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'pros') List<String> pros,
      @JsonKey(name: 'cons') List<String> cons});
}

/// @nodoc
class _$ProsAndConsModelCopyWithImpl<$Res, $Val extends ProsAndConsModel>
    implements $ProsAndConsModelCopyWith<$Res> {
  _$ProsAndConsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pros = null,
    Object? cons = null,
  }) {
    return _then(_value.copyWith(
      pros: null == pros
          ? _value.pros
          : pros // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cons: null == cons
          ? _value.cons
          : cons // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProsAndConsModelImplCopyWith<$Res>
    implements $ProsAndConsModelCopyWith<$Res> {
  factory _$$ProsAndConsModelImplCopyWith(_$ProsAndConsModelImpl value,
          $Res Function(_$ProsAndConsModelImpl) then) =
      __$$ProsAndConsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pros') List<String> pros,
      @JsonKey(name: 'cons') List<String> cons});
}

/// @nodoc
class __$$ProsAndConsModelImplCopyWithImpl<$Res>
    extends _$ProsAndConsModelCopyWithImpl<$Res, _$ProsAndConsModelImpl>
    implements _$$ProsAndConsModelImplCopyWith<$Res> {
  __$$ProsAndConsModelImplCopyWithImpl(_$ProsAndConsModelImpl _value,
      $Res Function(_$ProsAndConsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pros = null,
    Object? cons = null,
  }) {
    return _then(_$ProsAndConsModelImpl(
      pros: null == pros
          ? _value._pros
          : pros // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cons: null == cons
          ? _value._cons
          : cons // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProsAndConsModelImpl implements _ProsAndConsModel {
  const _$ProsAndConsModelImpl(
      {@JsonKey(name: 'pros') required final List<String> pros,
      @JsonKey(name: 'cons') required final List<String> cons})
      : _pros = pros,
        _cons = cons;

  factory _$ProsAndConsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProsAndConsModelImplFromJson(json);

  final List<String> _pros;
  @override
  @JsonKey(name: 'pros')
  List<String> get pros {
    if (_pros is EqualUnmodifiableListView) return _pros;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pros);
  }

  final List<String> _cons;
  @override
  @JsonKey(name: 'cons')
  List<String> get cons {
    if (_cons is EqualUnmodifiableListView) return _cons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cons);
  }

  @override
  String toString() {
    return 'ProsAndConsModel(pros: $pros, cons: $cons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProsAndConsModelImpl &&
            const DeepCollectionEquality().equals(other._pros, _pros) &&
            const DeepCollectionEquality().equals(other._cons, _cons));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pros),
      const DeepCollectionEquality().hash(_cons));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProsAndConsModelImplCopyWith<_$ProsAndConsModelImpl> get copyWith =>
      __$$ProsAndConsModelImplCopyWithImpl<_$ProsAndConsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProsAndConsModelImplToJson(
      this,
    );
  }
}

abstract class _ProsAndConsModel implements ProsAndConsModel {
  const factory _ProsAndConsModel(
          {@JsonKey(name: 'pros') required final List<String> pros,
          @JsonKey(name: 'cons') required final List<String> cons}) =
      _$ProsAndConsModelImpl;

  factory _ProsAndConsModel.fromJson(Map<String, dynamic> json) =
      _$ProsAndConsModelImpl.fromJson;

  @override
  @JsonKey(name: 'pros')
  List<String> get pros;
  @override
  @JsonKey(name: 'cons')
  List<String> get cons;
  @override
  @JsonKey(ignore: true)
  _$$ProsAndConsModelImplCopyWith<_$ProsAndConsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FinancialsModel _$FinancialsModelFromJson(Map<String, dynamic> json) {
  return _FinancialsModel.fromJson(json);
}

/// @nodoc
mixin _$FinancialsModel {
  @JsonKey(name: 'ebitda')
  List<FinancialEntryModel> get ebitda => throw _privateConstructorUsedError;
  @JsonKey(name: 'revenue')
  List<FinancialEntryModel> get revenue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FinancialsModelCopyWith<FinancialsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinancialsModelCopyWith<$Res> {
  factory $FinancialsModelCopyWith(
          FinancialsModel value, $Res Function(FinancialsModel) then) =
      _$FinancialsModelCopyWithImpl<$Res, FinancialsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ebitda') List<FinancialEntryModel> ebitda,
      @JsonKey(name: 'revenue') List<FinancialEntryModel> revenue});
}

/// @nodoc
class _$FinancialsModelCopyWithImpl<$Res, $Val extends FinancialsModel>
    implements $FinancialsModelCopyWith<$Res> {
  _$FinancialsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ebitda = null,
    Object? revenue = null,
  }) {
    return _then(_value.copyWith(
      ebitda: null == ebitda
          ? _value.ebitda
          : ebitda // ignore: cast_nullable_to_non_nullable
              as List<FinancialEntryModel>,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as List<FinancialEntryModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FinancialsModelImplCopyWith<$Res>
    implements $FinancialsModelCopyWith<$Res> {
  factory _$$FinancialsModelImplCopyWith(_$FinancialsModelImpl value,
          $Res Function(_$FinancialsModelImpl) then) =
      __$$FinancialsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ebitda') List<FinancialEntryModel> ebitda,
      @JsonKey(name: 'revenue') List<FinancialEntryModel> revenue});
}

/// @nodoc
class __$$FinancialsModelImplCopyWithImpl<$Res>
    extends _$FinancialsModelCopyWithImpl<$Res, _$FinancialsModelImpl>
    implements _$$FinancialsModelImplCopyWith<$Res> {
  __$$FinancialsModelImplCopyWithImpl(
      _$FinancialsModelImpl _value, $Res Function(_$FinancialsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ebitda = null,
    Object? revenue = null,
  }) {
    return _then(_$FinancialsModelImpl(
      ebitda: null == ebitda
          ? _value._ebitda
          : ebitda // ignore: cast_nullable_to_non_nullable
              as List<FinancialEntryModel>,
      revenue: null == revenue
          ? _value._revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as List<FinancialEntryModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FinancialsModelImpl implements _FinancialsModel {
  const _$FinancialsModelImpl(
      {@JsonKey(name: 'ebitda') required final List<FinancialEntryModel> ebitda,
      @JsonKey(name: 'revenue')
      required final List<FinancialEntryModel> revenue})
      : _ebitda = ebitda,
        _revenue = revenue;

  factory _$FinancialsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinancialsModelImplFromJson(json);

  final List<FinancialEntryModel> _ebitda;
  @override
  @JsonKey(name: 'ebitda')
  List<FinancialEntryModel> get ebitda {
    if (_ebitda is EqualUnmodifiableListView) return _ebitda;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ebitda);
  }

  final List<FinancialEntryModel> _revenue;
  @override
  @JsonKey(name: 'revenue')
  List<FinancialEntryModel> get revenue {
    if (_revenue is EqualUnmodifiableListView) return _revenue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_revenue);
  }

  @override
  String toString() {
    return 'FinancialsModel(ebitda: $ebitda, revenue: $revenue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinancialsModelImpl &&
            const DeepCollectionEquality().equals(other._ebitda, _ebitda) &&
            const DeepCollectionEquality().equals(other._revenue, _revenue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_ebitda),
      const DeepCollectionEquality().hash(_revenue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FinancialsModelImplCopyWith<_$FinancialsModelImpl> get copyWith =>
      __$$FinancialsModelImplCopyWithImpl<_$FinancialsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FinancialsModelImplToJson(
      this,
    );
  }
}

abstract class _FinancialsModel implements FinancialsModel {
  const factory _FinancialsModel(
      {@JsonKey(name: 'ebitda') required final List<FinancialEntryModel> ebitda,
      @JsonKey(name: 'revenue')
      required final List<FinancialEntryModel>
          revenue}) = _$FinancialsModelImpl;

  factory _FinancialsModel.fromJson(Map<String, dynamic> json) =
      _$FinancialsModelImpl.fromJson;

  @override
  @JsonKey(name: 'ebitda')
  List<FinancialEntryModel> get ebitda;
  @override
  @JsonKey(name: 'revenue')
  List<FinancialEntryModel> get revenue;
  @override
  @JsonKey(ignore: true)
  _$$FinancialsModelImplCopyWith<_$FinancialsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FinancialEntryModel _$FinancialEntryModelFromJson(Map<String, dynamic> json) {
  return _FinancialEntryModel.fromJson(json);
}

/// @nodoc
mixin _$FinancialEntryModel {
  @JsonKey(name: 'month')
  String get month => throw _privateConstructorUsedError;
  @JsonKey(name: 'value')
  double get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FinancialEntryModelCopyWith<FinancialEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinancialEntryModelCopyWith<$Res> {
  factory $FinancialEntryModelCopyWith(
          FinancialEntryModel value, $Res Function(FinancialEntryModel) then) =
      _$FinancialEntryModelCopyWithImpl<$Res, FinancialEntryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'month') String month,
      @JsonKey(name: 'value') double value});
}

/// @nodoc
class _$FinancialEntryModelCopyWithImpl<$Res, $Val extends FinancialEntryModel>
    implements $FinancialEntryModelCopyWith<$Res> {
  _$FinancialEntryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FinancialEntryModelImplCopyWith<$Res>
    implements $FinancialEntryModelCopyWith<$Res> {
  factory _$$FinancialEntryModelImplCopyWith(_$FinancialEntryModelImpl value,
          $Res Function(_$FinancialEntryModelImpl) then) =
      __$$FinancialEntryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'month') String month,
      @JsonKey(name: 'value') double value});
}

/// @nodoc
class __$$FinancialEntryModelImplCopyWithImpl<$Res>
    extends _$FinancialEntryModelCopyWithImpl<$Res, _$FinancialEntryModelImpl>
    implements _$$FinancialEntryModelImplCopyWith<$Res> {
  __$$FinancialEntryModelImplCopyWithImpl(_$FinancialEntryModelImpl _value,
      $Res Function(_$FinancialEntryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? value = null,
  }) {
    return _then(_$FinancialEntryModelImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FinancialEntryModelImpl implements _FinancialEntryModel {
  const _$FinancialEntryModelImpl(
      {@JsonKey(name: 'month') required this.month,
      @JsonKey(name: 'value') required this.value});

  factory _$FinancialEntryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinancialEntryModelImplFromJson(json);

  @override
  @JsonKey(name: 'month')
  final String month;
  @override
  @JsonKey(name: 'value')
  final double value;

  @override
  String toString() {
    return 'FinancialEntryModel(month: $month, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinancialEntryModelImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, month, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FinancialEntryModelImplCopyWith<_$FinancialEntryModelImpl> get copyWith =>
      __$$FinancialEntryModelImplCopyWithImpl<_$FinancialEntryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FinancialEntryModelImplToJson(
      this,
    );
  }
}

abstract class _FinancialEntryModel implements FinancialEntryModel {
  const factory _FinancialEntryModel(
          {@JsonKey(name: 'month') required final String month,
          @JsonKey(name: 'value') required final double value}) =
      _$FinancialEntryModelImpl;

  factory _FinancialEntryModel.fromJson(Map<String, dynamic> json) =
      _$FinancialEntryModelImpl.fromJson;

  @override
  @JsonKey(name: 'month')
  String get month;
  @override
  @JsonKey(name: 'value')
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$FinancialEntryModelImplCopyWith<_$FinancialEntryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IssuerDetailsModel _$IssuerDetailsModelFromJson(Map<String, dynamic> json) {
  return _IssuerDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$IssuerDetailsModel {
  @JsonKey(name: 'issuer_name')
  String get issuerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_of_issuer')
  String get typeOfIssuer => throw _privateConstructorUsedError;
  @JsonKey(name: 'sector')
  String get sector => throw _privateConstructorUsedError;
  @JsonKey(name: 'industry')
  String get industry => throw _privateConstructorUsedError;
  @JsonKey(name: 'issuer_nature')
  String get issuerNature => throw _privateConstructorUsedError;
  @JsonKey(name: 'cin')
  String get cin => throw _privateConstructorUsedError;
  @JsonKey(name: 'lead_manager')
  String? get leadManager => throw _privateConstructorUsedError;
  @JsonKey(name: 'registrar')
  String get registrar => throw _privateConstructorUsedError;
  @JsonKey(name: 'debenture_trustee')
  String get debentureTrustee => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IssuerDetailsModelCopyWith<IssuerDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IssuerDetailsModelCopyWith<$Res> {
  factory $IssuerDetailsModelCopyWith(
          IssuerDetailsModel value, $Res Function(IssuerDetailsModel) then) =
      _$IssuerDetailsModelCopyWithImpl<$Res, IssuerDetailsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'issuer_name') String issuerName,
      @JsonKey(name: 'type_of_issuer') String typeOfIssuer,
      @JsonKey(name: 'sector') String sector,
      @JsonKey(name: 'industry') String industry,
      @JsonKey(name: 'issuer_nature') String issuerNature,
      @JsonKey(name: 'cin') String cin,
      @JsonKey(name: 'lead_manager') String? leadManager,
      @JsonKey(name: 'registrar') String registrar,
      @JsonKey(name: 'debenture_trustee') String debentureTrustee});
}

/// @nodoc
class _$IssuerDetailsModelCopyWithImpl<$Res, $Val extends IssuerDetailsModel>
    implements $IssuerDetailsModelCopyWith<$Res> {
  _$IssuerDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? issuerName = null,
    Object? typeOfIssuer = null,
    Object? sector = null,
    Object? industry = null,
    Object? issuerNature = null,
    Object? cin = null,
    Object? leadManager = freezed,
    Object? registrar = null,
    Object? debentureTrustee = null,
  }) {
    return _then(_value.copyWith(
      issuerName: null == issuerName
          ? _value.issuerName
          : issuerName // ignore: cast_nullable_to_non_nullable
              as String,
      typeOfIssuer: null == typeOfIssuer
          ? _value.typeOfIssuer
          : typeOfIssuer // ignore: cast_nullable_to_non_nullable
              as String,
      sector: null == sector
          ? _value.sector
          : sector // ignore: cast_nullable_to_non_nullable
              as String,
      industry: null == industry
          ? _value.industry
          : industry // ignore: cast_nullable_to_non_nullable
              as String,
      issuerNature: null == issuerNature
          ? _value.issuerNature
          : issuerNature // ignore: cast_nullable_to_non_nullable
              as String,
      cin: null == cin
          ? _value.cin
          : cin // ignore: cast_nullable_to_non_nullable
              as String,
      leadManager: freezed == leadManager
          ? _value.leadManager
          : leadManager // ignore: cast_nullable_to_non_nullable
              as String?,
      registrar: null == registrar
          ? _value.registrar
          : registrar // ignore: cast_nullable_to_non_nullable
              as String,
      debentureTrustee: null == debentureTrustee
          ? _value.debentureTrustee
          : debentureTrustee // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IssuerDetailsModelImplCopyWith<$Res>
    implements $IssuerDetailsModelCopyWith<$Res> {
  factory _$$IssuerDetailsModelImplCopyWith(_$IssuerDetailsModelImpl value,
          $Res Function(_$IssuerDetailsModelImpl) then) =
      __$$IssuerDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'issuer_name') String issuerName,
      @JsonKey(name: 'type_of_issuer') String typeOfIssuer,
      @JsonKey(name: 'sector') String sector,
      @JsonKey(name: 'industry') String industry,
      @JsonKey(name: 'issuer_nature') String issuerNature,
      @JsonKey(name: 'cin') String cin,
      @JsonKey(name: 'lead_manager') String? leadManager,
      @JsonKey(name: 'registrar') String registrar,
      @JsonKey(name: 'debenture_trustee') String debentureTrustee});
}

/// @nodoc
class __$$IssuerDetailsModelImplCopyWithImpl<$Res>
    extends _$IssuerDetailsModelCopyWithImpl<$Res, _$IssuerDetailsModelImpl>
    implements _$$IssuerDetailsModelImplCopyWith<$Res> {
  __$$IssuerDetailsModelImplCopyWithImpl(_$IssuerDetailsModelImpl _value,
      $Res Function(_$IssuerDetailsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? issuerName = null,
    Object? typeOfIssuer = null,
    Object? sector = null,
    Object? industry = null,
    Object? issuerNature = null,
    Object? cin = null,
    Object? leadManager = freezed,
    Object? registrar = null,
    Object? debentureTrustee = null,
  }) {
    return _then(_$IssuerDetailsModelImpl(
      issuerName: null == issuerName
          ? _value.issuerName
          : issuerName // ignore: cast_nullable_to_non_nullable
              as String,
      typeOfIssuer: null == typeOfIssuer
          ? _value.typeOfIssuer
          : typeOfIssuer // ignore: cast_nullable_to_non_nullable
              as String,
      sector: null == sector
          ? _value.sector
          : sector // ignore: cast_nullable_to_non_nullable
              as String,
      industry: null == industry
          ? _value.industry
          : industry // ignore: cast_nullable_to_non_nullable
              as String,
      issuerNature: null == issuerNature
          ? _value.issuerNature
          : issuerNature // ignore: cast_nullable_to_non_nullable
              as String,
      cin: null == cin
          ? _value.cin
          : cin // ignore: cast_nullable_to_non_nullable
              as String,
      leadManager: freezed == leadManager
          ? _value.leadManager
          : leadManager // ignore: cast_nullable_to_non_nullable
              as String?,
      registrar: null == registrar
          ? _value.registrar
          : registrar // ignore: cast_nullable_to_non_nullable
              as String,
      debentureTrustee: null == debentureTrustee
          ? _value.debentureTrustee
          : debentureTrustee // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IssuerDetailsModelImpl extends _IssuerDetailsModel {
  const _$IssuerDetailsModelImpl(
      {@JsonKey(name: 'issuer_name') required this.issuerName,
      @JsonKey(name: 'type_of_issuer') required this.typeOfIssuer,
      @JsonKey(name: 'sector') required this.sector,
      @JsonKey(name: 'industry') required this.industry,
      @JsonKey(name: 'issuer_nature') required this.issuerNature,
      @JsonKey(name: 'cin') required this.cin,
      @JsonKey(name: 'lead_manager') this.leadManager,
      @JsonKey(name: 'registrar') required this.registrar,
      @JsonKey(name: 'debenture_trustee') required this.debentureTrustee})
      : super._();

  factory _$IssuerDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IssuerDetailsModelImplFromJson(json);

  @override
  @JsonKey(name: 'issuer_name')
  final String issuerName;
  @override
  @JsonKey(name: 'type_of_issuer')
  final String typeOfIssuer;
  @override
  @JsonKey(name: 'sector')
  final String sector;
  @override
  @JsonKey(name: 'industry')
  final String industry;
  @override
  @JsonKey(name: 'issuer_nature')
  final String issuerNature;
  @override
  @JsonKey(name: 'cin')
  final String cin;
  @override
  @JsonKey(name: 'lead_manager')
  final String? leadManager;
  @override
  @JsonKey(name: 'registrar')
  final String registrar;
  @override
  @JsonKey(name: 'debenture_trustee')
  final String debentureTrustee;

  @override
  String toString() {
    return 'IssuerDetailsModel(issuerName: $issuerName, typeOfIssuer: $typeOfIssuer, sector: $sector, industry: $industry, issuerNature: $issuerNature, cin: $cin, leadManager: $leadManager, registrar: $registrar, debentureTrustee: $debentureTrustee)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IssuerDetailsModelImpl &&
            (identical(other.issuerName, issuerName) ||
                other.issuerName == issuerName) &&
            (identical(other.typeOfIssuer, typeOfIssuer) ||
                other.typeOfIssuer == typeOfIssuer) &&
            (identical(other.sector, sector) || other.sector == sector) &&
            (identical(other.industry, industry) ||
                other.industry == industry) &&
            (identical(other.issuerNature, issuerNature) ||
                other.issuerNature == issuerNature) &&
            (identical(other.cin, cin) || other.cin == cin) &&
            (identical(other.leadManager, leadManager) ||
                other.leadManager == leadManager) &&
            (identical(other.registrar, registrar) ||
                other.registrar == registrar) &&
            (identical(other.debentureTrustee, debentureTrustee) ||
                other.debentureTrustee == debentureTrustee));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, issuerName, typeOfIssuer, sector,
      industry, issuerNature, cin, leadManager, registrar, debentureTrustee);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IssuerDetailsModelImplCopyWith<_$IssuerDetailsModelImpl> get copyWith =>
      __$$IssuerDetailsModelImplCopyWithImpl<_$IssuerDetailsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IssuerDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _IssuerDetailsModel extends IssuerDetailsModel {
  const factory _IssuerDetailsModel(
      {@JsonKey(name: 'issuer_name') required final String issuerName,
      @JsonKey(name: 'type_of_issuer') required final String typeOfIssuer,
      @JsonKey(name: 'sector') required final String sector,
      @JsonKey(name: 'industry') required final String industry,
      @JsonKey(name: 'issuer_nature') required final String issuerNature,
      @JsonKey(name: 'cin') required final String cin,
      @JsonKey(name: 'lead_manager') final String? leadManager,
      @JsonKey(name: 'registrar') required final String registrar,
      @JsonKey(name: 'debenture_trustee')
      required final String debentureTrustee}) = _$IssuerDetailsModelImpl;
  const _IssuerDetailsModel._() : super._();

  factory _IssuerDetailsModel.fromJson(Map<String, dynamic> json) =
      _$IssuerDetailsModelImpl.fromJson;

  @override
  @JsonKey(name: 'issuer_name')
  String get issuerName;
  @override
  @JsonKey(name: 'type_of_issuer')
  String get typeOfIssuer;
  @override
  @JsonKey(name: 'sector')
  String get sector;
  @override
  @JsonKey(name: 'industry')
  String get industry;
  @override
  @JsonKey(name: 'issuer_nature')
  String get issuerNature;
  @override
  @JsonKey(name: 'cin')
  String get cin;
  @override
  @JsonKey(name: 'lead_manager')
  String? get leadManager;
  @override
  @JsonKey(name: 'registrar')
  String get registrar;
  @override
  @JsonKey(name: 'debenture_trustee')
  String get debentureTrustee;
  @override
  @JsonKey(ignore: true)
  _$$IssuerDetailsModelImplCopyWith<_$IssuerDetailsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
