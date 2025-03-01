import 'package:hella_infra_app/core/constants/api_constant.dart';
import 'package:hella_infra_app/core/error/exception.dart';
import 'package:hella_infra_app/data/datasource/bond_data_source.dart';
import 'package:injectable/injectable.dart';
import '../../core/network/dio_client.dart';
import '../models/bond_model.dart';
import '../models/bond_detail_model.dart';

@LazySingleton(as: BondRemoteDataSource)
class BondRemoteDataSourceImpl implements BondRemoteDataSource {
  final DioClient client;

  BondRemoteDataSourceImpl(this.client);

  @override
  Future<List<BondModel>> getBonds() async {
    try {
      final response = await client.get(ApiConstants.bondListUrl);

      if (response != null) {
        final List<dynamic> bondListJson = response['data'] ?? [];
        return bondListJson.map((json) => BondModel.fromJson(json)).toList();
      } else {
        throw ServerException(message: 'Failed to load bonds');
      }
    } catch (e) {
      if (e is ServerException) rethrow;
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<BondDetailModel> getBondDetail(String bondId) async {
    try {
      final response = await client.get(
        ApiConstants.bondDetailUrl,
        queryParameters: {'id': bondId},
      );

      if (response != null) {
        return BondDetailModel.fromJson(response);
      } else {
        throw ServerException(message: 'Failed to load bond details');
      }
    } catch (e) {
      if (e is ServerException) rethrow;
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<BondModel>> searchBonds(String searchTerm) async {
    try {
      // First get all bonds
      final bonds = await getBonds();

      // Then filter locally based on the search term
      final searchTermLower = searchTerm.toLowerCase();
      return bonds.where((bond) {
        return bond.companyName.toLowerCase().contains(searchTermLower) ||
            bond.isin.toLowerCase().contains(searchTermLower) ||
            bond.tags.any((tag) => tag.toLowerCase().contains(searchTermLower));
      }).toList();
    } catch (e) {
      if (e is ServerException) rethrow;
      throw ServerException(message: e.toString());
    }
  }
}
