import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hella_infra_app/domain/repo/bond_repo_impl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hella_infra_app/core/error/exception.dart';
import 'package:hella_infra_app/core/error/failure.dart';
import 'package:hella_infra_app/core/network/network_info.dart';
import 'package:hella_infra_app/data/datasource/bond_data_source.dart';
import 'package:hella_infra_app/data/models/bond_detail_model.dart';
import 'dart:convert';

class MockBondRemoteDataSource extends Mock implements BondRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late BondRepositoryImpl repository;
  late MockBondRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockBondRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = BondRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );

    registerFallbackValue('');
  });

  const tBondId = 'INE06E507157';

  final jsonString = '''
  {
    "logo": "https://cdn.brandfetch.io/idVluv2fZa/w/200/h/200/theme/dark/icon.jpeg?c=1dxbfHSJFAPEGdCLU4o5B",
    "company_name": "Hella Infra Private Limited",
    "description": "Hella Infra is a construction materials platform.",
    "isin": "INE06E507157",
    "status": "ACTIVE",
    "pros_and_cons": {
      "pros": ["Strong government backing", "Healthy capitalisation profile"],
      "cons": ["Moderate profitability metrics"]
    },
    "financials": {
      "ebitda": [
        { "month": "Jan", "value": 12000000 },
        { "month": "Feb", "value": 13500000 }
      ],
      "revenue": [
        { "month": "Jan", "value": 25000000 },
        { "month": "Feb", "value": 26500000 }
      ]
    },
    "issuer_details": {
      "issuer_name": "TRUE CREDITS PRIVATE LIMITED",
      "type_of_issuer": "Non PSU",
      "sector": "Financial Services",
      "industry": "Finance",
      "issuer_nature": "NBFC",
      "cin": "U65190HR2017PTC070653",
      "lead_manager": "-",
      "registrar": "KFIN TECHNOLOGIES PRIVATE LIMITED",
      "debenture_trustee": "IDBI Trusteeship Services Limited"
    }
  }
  ''';

  final tBondDetailModel = BondDetailModel.fromJson(json.decode(jsonString));
  final tBondDetail = tBondDetailModel.toDomain();

  group('getBondDetail', () {
    test('should check if the device is online before calling remote data source', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.getBondDetail(tBondId)).thenAnswer((_) async => tBondDetailModel);

      await repository.getBondDetail(tBondId);

      verify(() => mockNetworkInfo.isConnected).called(1);
    });

    test('should return BondDetail when remote data source is successful', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.getBondDetail(tBondId)).thenAnswer((_) async => tBondDetailModel);

      final result = await repository.getBondDetail(tBondId);

      expect(result, Right(tBondDetail));
      verify(() => mockRemoteDataSource.getBondDetail(tBondId)).called(1);
    });

    test('should return ServerFailure when remote data source throws ServerException', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.getBondDetail(tBondId)).thenThrow(ServerException(message: 'Server error'));

      final result = await repository.getBondDetail(tBondId);

      expect(result, Left(ServerFailure(message: 'Server error')));
      verify(() => mockRemoteDataSource.getBondDetail(tBondId)).called(1);
    });

    test('should return NetworkFailure when device is offline', () async {
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      final result = await repository.getBondDetail(tBondId);

      expect(result, Left(NetworkFailure(message: 'No internet connection')));
      verifyNever(() => mockRemoteDataSource.getBondDetail(tBondId));
    });
  });
}
