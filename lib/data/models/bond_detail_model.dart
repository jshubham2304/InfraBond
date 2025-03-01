import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/bond_detail.dart';

part 'bond_detail_model.freezed.dart';
part 'bond_detail_model.g.dart';

@freezed
class BondDetailModel with _$BondDetailModel {
  const BondDetailModel._();

  const factory BondDetailModel({
    @JsonKey(name: 'logo') required String logo,
    @JsonKey(name: 'company_name') required String companyName,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'isin') required String isin,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'pros_and_cons') required ProsAndConsModel prosAndCons,
    @JsonKey(name: 'financials') required FinancialsModel financials,
    @JsonKey(name: 'issuer_details') required IssuerDetailsModel issuerDetails,
  }) = _BondDetailModel;

  factory BondDetailModel.fromJson(Map<String, dynamic> json) => _$BondDetailModelFromJson(json);

  BondDetail toDomain() {
    // Convert financial data to MonthlyFinancial entities
    final List<MonthlyFinancial> monthlyFinancials = [];
    for (int i = 0; i < financials.ebitda.length; i++) {
      final month = financials.ebitda[i].month;
      final ebitdaValue = financials.ebitda[i].value;
      final revenueValue = financials.revenue[i].value;

      monthlyFinancials.add(MonthlyFinancial(
        month: month,
        ebitda: ebitdaValue,
        revenue: revenueValue,
      ));
    }

    return BondDetail(
      id: isin,
      isin: isin,
      companyName: companyName,
      description: description,
      isActive: status.toUpperCase() == 'ACTIVE',
      financials: monthlyFinancials,
      pros: prosAndCons.pros.map((pro) => BondPro(description: pro)).toList(),
      cons: prosAndCons.cons.map((con) => BondCon(description: con)).toList(),
      issuerDetails: issuerDetails.toDomain(),
    );
  }
}

@freezed
class ProsAndConsModel with _$ProsAndConsModel {
  const factory ProsAndConsModel({
    @JsonKey(name: 'pros') required List<String> pros,
    @JsonKey(name: 'cons') required List<String> cons,
  }) = _ProsAndConsModel;

  factory ProsAndConsModel.fromJson(Map<String, dynamic> json) => _$ProsAndConsModelFromJson(json);
}

@freezed
class FinancialsModel with _$FinancialsModel {
  const factory FinancialsModel({
    @JsonKey(name: 'ebitda') required List<FinancialEntryModel> ebitda,
    @JsonKey(name: 'revenue') required List<FinancialEntryModel> revenue,
  }) = _FinancialsModel;

  factory FinancialsModel.fromJson(Map<String, dynamic> json) => _$FinancialsModelFromJson(json);
}

@freezed
class FinancialEntryModel with _$FinancialEntryModel {
  const factory FinancialEntryModel({
    @JsonKey(name: 'month') required String month,
    @JsonKey(name: 'value') required double value,
  }) = _FinancialEntryModel;

  factory FinancialEntryModel.fromJson(Map<String, dynamic> json) => _$FinancialEntryModelFromJson(json);
}

@freezed
class IssuerDetailsModel with _$IssuerDetailsModel {
  const IssuerDetailsModel._();

  const factory IssuerDetailsModel({
    @JsonKey(name: 'issuer_name') required String issuerName,
    @JsonKey(name: 'type_of_issuer') required String typeOfIssuer,
    @JsonKey(name: 'sector') required String sector,
    @JsonKey(name: 'industry') required String industry,
    @JsonKey(name: 'issuer_nature') required String issuerNature,
    @JsonKey(name: 'cin') required String cin,
    @JsonKey(name: 'lead_manager') String? leadManager,
    @JsonKey(name: 'registrar') required String registrar,
    @JsonKey(name: 'debenture_trustee') required String debentureTrustee,
  }) = _IssuerDetailsModel;

  factory IssuerDetailsModel.fromJson(Map<String, dynamic> json) => _$IssuerDetailsModelFromJson(json);

  IssuerDetails toDomain() {
    return IssuerDetails(
      issuerName: issuerName,
      typeOfIssuer: typeOfIssuer,
      sector: sector,
      industry: industry,
      issuerNature: issuerNature,
      cin: cin,
      leadManager: leadManager,
      registrar: registrar,
      trustee: debentureTrustee,
    );
  }
}
