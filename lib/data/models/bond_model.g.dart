// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bond_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BondModelImpl _$$BondModelImplFromJson(Map<String, dynamic> json) =>
    _$BondModelImpl(
      isin: json['isin'] as String,
      logo: json['logo'] as String,
      rating: json['rating'] as String,
      companyName: json['company_name'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$BondModelImplToJson(_$BondModelImpl instance) =>
    <String, dynamic>{
      'isin': instance.isin,
      'logo': instance.logo,
      'rating': instance.rating,
      'company_name': instance.companyName,
      'tags': instance.tags,
    };
