import 'package:dartz/dartz.dart';
import 'package:hella_infra_app/core/error/failure.dart';
import 'package:hella_infra_app/domain/repo/bond_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';

import '../entities/bond_detail.dart';

@lazySingleton
class GetBondDetail {
  final BondRepository repository;

  GetBondDetail(this.repository);

  Future<Either<Failure, BondDetail>> call(BondDetailParams params) async {
    return repository.getBondDetail(params.bondId);
  }
}

class BondDetailParams extends Equatable {
  final String bondId;

  const BondDetailParams({required this.bondId});

  @override
  List<Object> get props => [bondId];
}
