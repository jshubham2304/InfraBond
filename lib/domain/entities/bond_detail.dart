import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hella_infra_app/domain/entities/bond.dart';

part 'bond_detail.freezed.dart';

@freezed
class BondDetail with _$BondDetail {
  const factory BondDetail({
    required String id,
    required String isin,
    required String companyName,
    required String description,
    required bool isActive,
    required List<MonthlyFinancial> financials,
    required List<BondPro> pros,
    required List<BondCon> cons,
    required IssuerDetails issuerDetails,
  }) = _BondDetail;
}

@freezed
class MonthlyFinancial with _$MonthlyFinancial {
  const factory MonthlyFinancial({
    required String month,
    required double revenue,
    required double ebitda,
  }) = _MonthlyFinancial;
}

@freezed
class BondPro with _$BondPro {
  const factory BondPro({
    required String description,
  }) = _BondPro;
}

@freezed
class BondCon with _$BondCon {
  const factory BondCon({
    required String description,
  }) = _BondCon;
}

@freezed
class IssuerDetails with _$IssuerDetails {
  const factory IssuerDetails({
    required String issuerName,
    required String typeOfIssuer,
    required String sector,
    required String industry,
    required String issuerNature,
    required String cin,
    required String? leadManager,
    required String registrar,
    required String trustee,
  }) = _IssuerDetails;
}

extension BondDetailToBond on BondDetail {
  Bond toBond() {
    return Bond(
      id: id,
      code: isin,
      companyName: companyName,
      rating: 'AAA', // Default if not available
      logoUrl: '', // Default if not available
      tags: const [], // Default if not available
      isActive: isActive,
    );
  }
}
