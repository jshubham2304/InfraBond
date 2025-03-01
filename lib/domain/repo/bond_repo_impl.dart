import 'package:dartz/dartz.dart';
import 'package:hella_infra_app/core/error/exception.dart';
import 'package:hella_infra_app/core/error/failure.dart';
import 'package:hella_infra_app/core/network/network_info.dart';
import 'package:hella_infra_app/data/datasource/bond_data_source.dart';
import 'package:hella_infra_app/domain/entities/bond.dart';
import 'package:hella_infra_app/domain/entities/bond_detail.dart';
import 'package:hella_infra_app/domain/repo/bond_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BondRepository)
class BondRepositoryImpl implements BondRepository {
  final BondRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  BondRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Bond>>> getBonds() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteBonds = await remoteDataSource.getBonds();
        return Right(remoteBonds.map((model) => model.toDomain()).toList());
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, BondDetail>> getBondDetail(String bondId) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteBondDetail = await remoteDataSource.getBondDetail(bondId);
        return Right(remoteBondDetail.toDomain());
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<Bond>>> searchBonds(String searchTerm) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteBonds = await remoteDataSource.searchBonds(searchTerm);
        return Right(remoteBonds.map((model) => model.toDomain()).toList());
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }
  }
}
