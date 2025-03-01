import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/bond.dart';

part 'bond_model.freezed.dart';
part 'bond_model.g.dart';

@freezed
class BondModel with _$BondModel {
  const BondModel._();

  const factory BondModel({
    @JsonKey(name: 'isin') required String isin,
    @JsonKey(name: 'logo') required String logo,
    @JsonKey(name: 'rating') required String rating,
    @JsonKey(name: 'company_name') required String companyName,
    @JsonKey(name: 'tags') required List<String> tags,
  }) = _BondModel;

  factory BondModel.fromJson(Map<String, dynamic> json) => _$BondModelFromJson(json);

  Bond toDomain() {
    return Bond(
      id: isin,
      code: isin,
      companyName: companyName,
      rating: rating,
      logoUrl: logo,
      tags: tags,
      isActive: true, // Default value as it's not in the JSON
    );
  }
}
