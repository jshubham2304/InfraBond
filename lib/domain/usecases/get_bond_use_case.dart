import 'package:dartz/dartz.dart';
import 'package:hella_infra_app/core/error/failure.dart';
import 'package:hella_infra_app/domain/repo/bond_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import '../entities/bond.dart';

@lazySingleton
class GetBondList {
  final BondRepository repository;

  GetBondList(this.repository);

  Future<Either<Failure, List<Bond>>> call({String? searchTerm}) async {
    // if (searchTerm != null && searchTerm.isNotEmpty) {
    //   return repository.searchBonds(searchTerm);
    // } else {
    return repository.getBonds();
    // }
  }
}

class BondListParams extends Equatable {
  final String? searchTerm;

  const BondListParams({this.searchTerm});

  @override
  List<Object?> get props => [searchTerm];
}
