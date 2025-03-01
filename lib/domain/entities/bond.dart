import 'package:freezed_annotation/freezed_annotation.dart';

part 'bond.freezed.dart';

@freezed
class Bond with _$Bond {
  const factory Bond({
    required String id,
    required String code,
    required String companyName,
    required String rating,
    required String logoUrl,
    required List<String> tags,
    required bool isActive,
  }) = _Bond;
}
