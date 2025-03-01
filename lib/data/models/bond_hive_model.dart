import 'package:hive/hive.dart';
import '../../domain/entities/bond.dart';

part 'bond_hive_model.g.dart';

@HiveType(typeId: 0)
class BondHiveModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String code;

  @HiveField(2)
  final String companyName;

  @HiveField(3)
  final String rating;

  @HiveField(4)
  final String logoUrl;

  @HiveField(5)
  final List<String> tags;

  @HiveField(6)
  final bool isActive;

  @HiveField(7)
  final DateTime bookmarkedAt;

  BondHiveModel({
    required this.id,
    required this.code,
    required this.companyName,
    required this.rating,
    required this.logoUrl,
    required this.tags,
    required this.isActive,
    required this.bookmarkedAt,
  });

  // Convert from domain entity
  factory BondHiveModel.fromDomain(Bond bond) {
    return BondHiveModel(
      id: bond.id,
      code: bond.code,
      companyName: bond.companyName,
      rating: bond.rating,
      logoUrl: bond.logoUrl,
      tags: bond.tags,
      isActive: bond.isActive,
      bookmarkedAt: DateTime.now(),
    );
  }

  // Convert to domain entity
  Bond toDomain() {
    return Bond(
      id: id,
      code: code,
      companyName: companyName,
      rating: rating,
      logoUrl: logoUrl,
      tags: tags,
      isActive: isActive,
    );
  }

  // For sorting by most recently bookmarked
  static int sortByBookmarkedTimeDesc(BondHiveModel a, BondHiveModel b) {
    return b.bookmarkedAt.compareTo(a.bookmarkedAt);
  }
}
