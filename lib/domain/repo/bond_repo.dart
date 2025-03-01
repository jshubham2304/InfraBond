import 'package:dartz/dartz.dart';
import 'package:hella_infra_app/core/error/failure.dart';
import 'package:hella_infra_app/domain/entities/bond_detail.dart';

import '../entities/bond.dart';

abstract class BondRepository {
  /// Gets a list of all bonds
  Future<Either<Failure, List<Bond>>> getBonds();

  /// Gets detailed information for a specific bond
  Future<Either<Failure, BondDetail>> getBondDetail(String bondId);

  /// Searches for bonds based on search term
  Future<Either<Failure, List<Bond>>> searchBonds(String searchTerm);
}
