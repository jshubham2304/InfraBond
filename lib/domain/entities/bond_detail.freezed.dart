// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bond_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BondDetail {
  String get id => throw _privateConstructorUsedError;
  String get isin => throw _privateConstructorUsedError;
  String get companyName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  List<MonthlyFinancial> get financials => throw _privateConstructorUsedError;
  List<BondPro> get pros => throw _privateConstructorUsedError;
  List<BondCon> get cons => throw _privateConstructorUsedError;
  IssuerDetails get issuerDetails => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BondDetailCopyWith<BondDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BondDetailCopyWith<$Res> {
  factory $BondDetailCopyWith(
          BondDetail value, $Res Function(BondDetail) then) =
      _$BondDetailCopyWithImpl<$Res, BondDetail>;
  @useResult
  $Res call(
      {String id,
      String isin,
      String companyName,
      String description,
      bool isActive,
      List<MonthlyFinancial> financials,
      List<BondPro> pros,
      List<BondCon> cons,
      IssuerDetails issuerDetails});

  $IssuerDetailsCopyWith<$Res> get issuerDetails;
}

/// @nodoc
class _$BondDetailCopyWithImpl<$Res, $Val extends BondDetail>
    implements $BondDetailCopyWith<$Res> {
  _$BondDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isin = null,
    Object? companyName = null,
    Object? description = null,
    Object? isActive = null,
    Object? financials = null,
    Object? pros = null,
    Object? cons = null,
    Object? issuerDetails = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isin: null == isin
          ? _value.isin
          : isin // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      financials: null == financials
          ? _value.financials
          : financials // ignore: cast_nullable_to_non_nullable
              as List<MonthlyFinancial>,
      pros: null == pros
          ? _value.pros
          : pros // ignore: cast_nullable_to_non_nullable
              as List<BondPro>,
      cons: null == cons
          ? _value.cons
          : cons // ignore: cast_nullable_to_non_nullable
              as List<BondCon>,
      issuerDetails: null == issuerDetails
          ? _value.issuerDetails
          : issuerDetails // ignore: cast_nullable_to_non_nullable
              as IssuerDetails,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IssuerDetailsCopyWith<$Res> get issuerDetails {
    return $IssuerDetailsCopyWith<$Res>(_value.issuerDetails, (value) {
      return _then(_value.copyWith(issuerDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BondDetailImplCopyWith<$Res>
    implements $BondDetailCopyWith<$Res> {
  factory _$$BondDetailImplCopyWith(
          _$BondDetailImpl value, $Res Function(_$BondDetailImpl) then) =
      __$$BondDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String isin,
      String companyName,
      String description,
      bool isActive,
      List<MonthlyFinancial> financials,
      List<BondPro> pros,
      List<BondCon> cons,
      IssuerDetails issuerDetails});

  @override
  $IssuerDetailsCopyWith<$Res> get issuerDetails;
}

/// @nodoc
class __$$BondDetailImplCopyWithImpl<$Res>
    extends _$BondDetailCopyWithImpl<$Res, _$BondDetailImpl>
    implements _$$BondDetailImplCopyWith<$Res> {
  __$$BondDetailImplCopyWithImpl(
      _$BondDetailImpl _value, $Res Function(_$BondDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isin = null,
    Object? companyName = null,
    Object? description = null,
    Object? isActive = null,
    Object? financials = null,
    Object? pros = null,
    Object? cons = null,
    Object? issuerDetails = null,
  }) {
    return _then(_$BondDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isin: null == isin
          ? _value.isin
          : isin // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      financials: null == financials
          ? _value._financials
          : financials // ignore: cast_nullable_to_non_nullable
              as List<MonthlyFinancial>,
      pros: null == pros
          ? _value._pros
          : pros // ignore: cast_nullable_to_non_nullable
              as List<BondPro>,
      cons: null == cons
          ? _value._cons
          : cons // ignore: cast_nullable_to_non_nullable
              as List<BondCon>,
      issuerDetails: null == issuerDetails
          ? _value.issuerDetails
          : issuerDetails // ignore: cast_nullable_to_non_nullable
              as IssuerDetails,
    ));
  }
}

/// @nodoc

class _$BondDetailImpl implements _BondDetail {
  const _$BondDetailImpl(
      {required this.id,
      required this.isin,
      required this.companyName,
      required this.description,
      required this.isActive,
      required final List<MonthlyFinancial> financials,
      required final List<BondPro> pros,
      required final List<BondCon> cons,
      required this.issuerDetails})
      : _financials = financials,
        _pros = pros,
        _cons = cons;

  @override
  final String id;
  @override
  final String isin;
  @override
  final String companyName;
  @override
  final String description;
  @override
  final bool isActive;
  final List<MonthlyFinancial> _financials;
  @override
  List<MonthlyFinancial> get financials {
    if (_financials is EqualUnmodifiableListView) return _financials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_financials);
  }

  final List<BondPro> _pros;
  @override
  List<BondPro> get pros {
    if (_pros is EqualUnmodifiableListView) return _pros;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pros);
  }

  final List<BondCon> _cons;
  @override
  List<BondCon> get cons {
    if (_cons is EqualUnmodifiableListView) return _cons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cons);
  }

  @override
  final IssuerDetails issuerDetails;

  @override
  String toString() {
    return 'BondDetail(id: $id, isin: $isin, companyName: $companyName, description: $description, isActive: $isActive, financials: $financials, pros: $pros, cons: $cons, issuerDetails: $issuerDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BondDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isin, isin) || other.isin == isin) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._financials, _financials) &&
            const DeepCollectionEquality().equals(other._pros, _pros) &&
            const DeepCollectionEquality().equals(other._cons, _cons) &&
            (identical(other.issuerDetails, issuerDetails) ||
                other.issuerDetails == issuerDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isin,
      companyName,
      description,
      isActive,
      const DeepCollectionEquality().hash(_financials),
      const DeepCollectionEquality().hash(_pros),
      const DeepCollectionEquality().hash(_cons),
      issuerDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BondDetailImplCopyWith<_$BondDetailImpl> get copyWith =>
      __$$BondDetailImplCopyWithImpl<_$BondDetailImpl>(this, _$identity);
}

abstract class _BondDetail implements BondDetail {
  const factory _BondDetail(
      {required final String id,
      required final String isin,
      required final String companyName,
      required final String description,
      required final bool isActive,
      required final List<MonthlyFinancial> financials,
      required final List<BondPro> pros,
      required final List<BondCon> cons,
      required final IssuerDetails issuerDetails}) = _$BondDetailImpl;

  @override
  String get id;
  @override
  String get isin;
  @override
  String get companyName;
  @override
  String get description;
  @override
  bool get isActive;
  @override
  List<MonthlyFinancial> get financials;
  @override
  List<BondPro> get pros;
  @override
  List<BondCon> get cons;
  @override
  IssuerDetails get issuerDetails;
  @override
  @JsonKey(ignore: true)
  _$$BondDetailImplCopyWith<_$BondDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MonthlyFinancial {
  String get month => throw _privateConstructorUsedError;
  double get revenue => throw _privateConstructorUsedError;
  double get ebitda => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MonthlyFinancialCopyWith<MonthlyFinancial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyFinancialCopyWith<$Res> {
  factory $MonthlyFinancialCopyWith(
          MonthlyFinancial value, $Res Function(MonthlyFinancial) then) =
      _$MonthlyFinancialCopyWithImpl<$Res, MonthlyFinancial>;
  @useResult
  $Res call({String month, double revenue, double ebitda});
}

/// @nodoc
class _$MonthlyFinancialCopyWithImpl<$Res, $Val extends MonthlyFinancial>
    implements $MonthlyFinancialCopyWith<$Res> {
  _$MonthlyFinancialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? revenue = null,
    Object? ebitda = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      ebitda: null == ebitda
          ? _value.ebitda
          : ebitda // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlyFinancialImplCopyWith<$Res>
    implements $MonthlyFinancialCopyWith<$Res> {
  factory _$$MonthlyFinancialImplCopyWith(_$MonthlyFinancialImpl value,
          $Res Function(_$MonthlyFinancialImpl) then) =
      __$$MonthlyFinancialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String month, double revenue, double ebitda});
}

/// @nodoc
class __$$MonthlyFinancialImplCopyWithImpl<$Res>
    extends _$MonthlyFinancialCopyWithImpl<$Res, _$MonthlyFinancialImpl>
    implements _$$MonthlyFinancialImplCopyWith<$Res> {
  __$$MonthlyFinancialImplCopyWithImpl(_$MonthlyFinancialImpl _value,
      $Res Function(_$MonthlyFinancialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? revenue = null,
    Object? ebitda = null,
  }) {
    return _then(_$MonthlyFinancialImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
      ebitda: null == ebitda
          ? _value.ebitda
          : ebitda // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$MonthlyFinancialImpl implements _MonthlyFinancial {
  const _$MonthlyFinancialImpl(
      {required this.month, required this.revenue, required this.ebitda});

  @override
  final String month;
  @override
  final double revenue;
  @override
  final double ebitda;

  @override
  String toString() {
    return 'MonthlyFinancial(month: $month, revenue: $revenue, ebitda: $ebitda)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyFinancialImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            (identical(other.ebitda, ebitda) || other.ebitda == ebitda));
  }

  @override
  int get hashCode => Object.hash(runtimeType, month, revenue, ebitda);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyFinancialImplCopyWith<_$MonthlyFinancialImpl> get copyWith =>
      __$$MonthlyFinancialImplCopyWithImpl<_$MonthlyFinancialImpl>(
          this, _$identity);
}

abstract class _MonthlyFinancial implements MonthlyFinancial {
  const factory _MonthlyFinancial(
      {required final String month,
      required final double revenue,
      required final double ebitda}) = _$MonthlyFinancialImpl;

  @override
  String get month;
  @override
  double get revenue;
  @override
  double get ebitda;
  @override
  @JsonKey(ignore: true)
  _$$MonthlyFinancialImplCopyWith<_$MonthlyFinancialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BondPro {
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BondProCopyWith<BondPro> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BondProCopyWith<$Res> {
  factory $BondProCopyWith(BondPro value, $Res Function(BondPro) then) =
      _$BondProCopyWithImpl<$Res, BondPro>;
  @useResult
  $Res call({String description});
}

/// @nodoc
class _$BondProCopyWithImpl<$Res, $Val extends BondPro>
    implements $BondProCopyWith<$Res> {
  _$BondProCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BondProImplCopyWith<$Res> implements $BondProCopyWith<$Res> {
  factory _$$BondProImplCopyWith(
          _$BondProImpl value, $Res Function(_$BondProImpl) then) =
      __$$BondProImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description});
}

/// @nodoc
class __$$BondProImplCopyWithImpl<$Res>
    extends _$BondProCopyWithImpl<$Res, _$BondProImpl>
    implements _$$BondProImplCopyWith<$Res> {
  __$$BondProImplCopyWithImpl(
      _$BondProImpl _value, $Res Function(_$BondProImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
  }) {
    return _then(_$BondProImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BondProImpl implements _BondPro {
  const _$BondProImpl({required this.description});

  @override
  final String description;

  @override
  String toString() {
    return 'BondPro(description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BondProImpl &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BondProImplCopyWith<_$BondProImpl> get copyWith =>
      __$$BondProImplCopyWithImpl<_$BondProImpl>(this, _$identity);
}

abstract class _BondPro implements BondPro {
  const factory _BondPro({required final String description}) = _$BondProImpl;

  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$BondProImplCopyWith<_$BondProImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BondCon {
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BondConCopyWith<BondCon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BondConCopyWith<$Res> {
  factory $BondConCopyWith(BondCon value, $Res Function(BondCon) then) =
      _$BondConCopyWithImpl<$Res, BondCon>;
  @useResult
  $Res call({String description});
}

/// @nodoc
class _$BondConCopyWithImpl<$Res, $Val extends BondCon>
    implements $BondConCopyWith<$Res> {
  _$BondConCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BondConImplCopyWith<$Res> implements $BondConCopyWith<$Res> {
  factory _$$BondConImplCopyWith(
          _$BondConImpl value, $Res Function(_$BondConImpl) then) =
      __$$BondConImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description});
}

/// @nodoc
class __$$BondConImplCopyWithImpl<$Res>
    extends _$BondConCopyWithImpl<$Res, _$BondConImpl>
    implements _$$BondConImplCopyWith<$Res> {
  __$$BondConImplCopyWithImpl(
      _$BondConImpl _value, $Res Function(_$BondConImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
  }) {
    return _then(_$BondConImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BondConImpl implements _BondCon {
  const _$BondConImpl({required this.description});

  @override
  final String description;

  @override
  String toString() {
    return 'BondCon(description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BondConImpl &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BondConImplCopyWith<_$BondConImpl> get copyWith =>
      __$$BondConImplCopyWithImpl<_$BondConImpl>(this, _$identity);
}

abstract class _BondCon implements BondCon {
  const factory _BondCon({required final String description}) = _$BondConImpl;

  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$BondConImplCopyWith<_$BondConImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$IssuerDetails {
  String get issuerName => throw _privateConstructorUsedError;
  String get typeOfIssuer => throw _privateConstructorUsedError;
  String get sector => throw _privateConstructorUsedError;
  String get industry => throw _privateConstructorUsedError;
  String get issuerNature => throw _privateConstructorUsedError;
  String get cin => throw _privateConstructorUsedError;
  String? get leadManager => throw _privateConstructorUsedError;
  String get registrar => throw _privateConstructorUsedError;
  String get trustee => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IssuerDetailsCopyWith<IssuerDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IssuerDetailsCopyWith<$Res> {
  factory $IssuerDetailsCopyWith(
          IssuerDetails value, $Res Function(IssuerDetails) then) =
      _$IssuerDetailsCopyWithImpl<$Res, IssuerDetails>;
  @useResult
  $Res call(
      {String issuerName,
      String typeOfIssuer,
      String sector,
      String industry,
      String issuerNature,
      String cin,
      String? leadManager,
      String registrar,
      String trustee});
}

/// @nodoc
class _$IssuerDetailsCopyWithImpl<$Res, $Val extends IssuerDetails>
    implements $IssuerDetailsCopyWith<$Res> {
  _$IssuerDetailsCopyWithImpl(this._value, this._then);

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
    Object? trustee = null,
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
      trustee: null == trustee
          ? _value.trustee
          : trustee // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IssuerDetailsImplCopyWith<$Res>
    implements $IssuerDetailsCopyWith<$Res> {
  factory _$$IssuerDetailsImplCopyWith(
          _$IssuerDetailsImpl value, $Res Function(_$IssuerDetailsImpl) then) =
      __$$IssuerDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String issuerName,
      String typeOfIssuer,
      String sector,
      String industry,
      String issuerNature,
      String cin,
      String? leadManager,
      String registrar,
      String trustee});
}

/// @nodoc
class __$$IssuerDetailsImplCopyWithImpl<$Res>
    extends _$IssuerDetailsCopyWithImpl<$Res, _$IssuerDetailsImpl>
    implements _$$IssuerDetailsImplCopyWith<$Res> {
  __$$IssuerDetailsImplCopyWithImpl(
      _$IssuerDetailsImpl _value, $Res Function(_$IssuerDetailsImpl) _then)
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
    Object? trustee = null,
  }) {
    return _then(_$IssuerDetailsImpl(
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
      trustee: null == trustee
          ? _value.trustee
          : trustee // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$IssuerDetailsImpl implements _IssuerDetails {
  const _$IssuerDetailsImpl(
      {required this.issuerName,
      required this.typeOfIssuer,
      required this.sector,
      required this.industry,
      required this.issuerNature,
      required this.cin,
      required this.leadManager,
      required this.registrar,
      required this.trustee});

  @override
  final String issuerName;
  @override
  final String typeOfIssuer;
  @override
  final String sector;
  @override
  final String industry;
  @override
  final String issuerNature;
  @override
  final String cin;
  @override
  final String? leadManager;
  @override
  final String registrar;
  @override
  final String trustee;

  @override
  String toString() {
    return 'IssuerDetails(issuerName: $issuerName, typeOfIssuer: $typeOfIssuer, sector: $sector, industry: $industry, issuerNature: $issuerNature, cin: $cin, leadManager: $leadManager, registrar: $registrar, trustee: $trustee)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IssuerDetailsImpl &&
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
            (identical(other.trustee, trustee) || other.trustee == trustee));
  }

  @override
  int get hashCode => Object.hash(runtimeType, issuerName, typeOfIssuer, sector,
      industry, issuerNature, cin, leadManager, registrar, trustee);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IssuerDetailsImplCopyWith<_$IssuerDetailsImpl> get copyWith =>
      __$$IssuerDetailsImplCopyWithImpl<_$IssuerDetailsImpl>(this, _$identity);
}

abstract class _IssuerDetails implements IssuerDetails {
  const factory _IssuerDetails(
      {required final String issuerName,
      required final String typeOfIssuer,
      required final String sector,
      required final String industry,
      required final String issuerNature,
      required final String cin,
      required final String? leadManager,
      required final String registrar,
      required final String trustee}) = _$IssuerDetailsImpl;

  @override
  String get issuerName;
  @override
  String get typeOfIssuer;
  @override
  String get sector;
  @override
  String get industry;
  @override
  String get issuerNature;
  @override
  String get cin;
  @override
  String? get leadManager;
  @override
  String get registrar;
  @override
  String get trustee;
  @override
  @JsonKey(ignore: true)
  _$$IssuerDetailsImplCopyWith<_$IssuerDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
