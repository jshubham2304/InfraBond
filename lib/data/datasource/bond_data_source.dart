import 'package:hella_infra_app/data/models/bond_model.dart';
import 'package:hella_infra_app/data/models/bond_detail_model.dart';

abstract class BondRemoteDataSource {
  /// Calls the API endpoint to get all bonds
  ///
  /// Throws a [ServerException] for all error codes
  Future<List<BondModel>> getBonds();

  /// Calls the API endpoint to get details for a specific bond
  ///
  /// Throws a [ServerException] for all error codes
  Future<BondDetailModel> getBondDetail(String bondId);

  /// Calls the API endpoint to search for bonds
  ///
  /// Throws a [ServerException] for all error codes
  Future<List<BondModel>> searchBonds(String searchTerm);
}
