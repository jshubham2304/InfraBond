import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hella_infra_app/presentation/bloc/bond_detail_cubit.dart';
import 'package:hella_infra_app/presentation/bloc/bond_detail_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hella_infra_app/core/error/failure.dart';
import 'package:hella_infra_app/core/utils/haptic_feedback.dart';
import 'package:hella_infra_app/domain/entities/bond_detail.dart';
import 'package:hella_infra_app/domain/usecases/get_bond_details_use_case.dart';

class MockGetBondDetail extends Mock implements GetBondDetail {}

class MockHapticFeedbackHelper extends Mock implements HapticFeedbackHelper {}

void main() {
  late BondDetailCubit cubit;
  late MockGetBondDetail mockGetBondDetail;
  late MockHapticFeedbackHelper mockHapticFeedbackHelper;

  setUp(() {
    mockGetBondDetail = MockGetBondDetail();
    mockHapticFeedbackHelper = MockHapticFeedbackHelper();
    cubit = BondDetailCubit(
      getBondDetail: mockGetBondDetail,
      hapticFeedback: mockHapticFeedbackHelper,
    );

    registerFallbackValue(BondDetailParams(bondId: ''));
    registerFallbackValue(HapticFeedbackType.light);
  });

  const testBondId = 'INE06E507157';
  final testBondDetail = BondDetail(
    id: testBondId,
    isin: testBondId,
    companyName: 'Hella Infra Private Limited',
    description: 'Hella Infra is a construction materials platform.',
    isActive: true,
    financials: [],
    pros: [],
    cons: [],
    issuerDetails: IssuerDetails(
      issuerName: "TRUE CREDITS PRIVATE LIMITED",
      typeOfIssuer: "Non PSU",
      sector: "Financial Services",
      industry: "Finance",
      issuerNature: "NBFC",
      cin: "U65190HR2017PTC070653",
      leadManager: null,
      registrar: "KFIN TECHNOLOGIES PRIVATE LIMITED",
      trustee: "IDBI Trusteeship Services Limited",
    ),
  );

  group('BondDetailCubit', () {
    test('initial state should be BondDetailState.initial()', () {
      expect(cubit.state, BondDetailState.initial());
    });

    blocTest<BondDetailCubit, BondDetailState>(
      'emits [loading, success] when bond details are loaded successfully',
      build: () {
        when(() => mockGetBondDetail.call(any())).thenAnswer((_) async => Right(testBondDetail));
        when(() => mockHapticFeedbackHelper.feedback(HapticFeedbackType.light)).thenAnswer((_) => Future.value());

        return cubit;
      },
      act: (cubit) => cubit.loadBondDetail(testBondId),
      expect: () => [
        BondDetailState.initial().copyWith(isLoading: true, errorMessage: null),
        BondDetailState.initial().copyWith(
          isLoading: false,
          bondDetail: testBondDetail,
          errorMessage: null,
        ),
      ],
      verify: (_) {
        verify(() => mockGetBondDetail.call(any())).called(1);
        verify(() => mockHapticFeedbackHelper.feedback(HapticFeedbackType.light)).called(1);
      },
    );

    blocTest<BondDetailCubit, BondDetailState>(
      'emits [loading, error] when loading bond details fails',
      build: () {
        when(() => mockGetBondDetail.call(any())).thenAnswer((_) async => Left(ServerFailure(message: 'Server error')));
        when(() => mockHapticFeedbackHelper.feedback(HapticFeedbackType.error)).thenAnswer((_) => Future.value());

        return cubit;
      },
      act: (cubit) => cubit.loadBondDetail(testBondId),
      expect: () => [
        BondDetailState.initial().copyWith(isLoading: true, errorMessage: null),
        BondDetailState.initial().copyWith(
          isLoading: false,
          errorMessage: 'Server error',
        ),
      ],
      verify: (_) {
        verify(() => mockGetBondDetail.call(any())).called(1);
        verify(() => mockHapticFeedbackHelper.feedback(HapticFeedbackType.error)).called(1);
      },
    );

    blocTest<BondDetailCubit, BondDetailState>(
      'emits new state when changeTab is called',
      build: () {
        when(() => mockHapticFeedbackHelper.feedback(HapticFeedbackType.medium)).thenAnswer((_) => Future.value());
        return cubit;
      },
      act: (cubit) => cubit.changeTab(BondDetailTab.prosAndCons),
      expect: () => [
        BondDetailState.initial().copyWith(activeTab: BondDetailTab.prosAndCons),
      ],
      verify: (_) {
        verify(() => mockHapticFeedbackHelper.feedback(HapticFeedbackType.medium)).called(1);
      },
    );

    blocTest<BondDetailCubit, BondDetailState>(
      'emits new state when changeChartType is called',
      build: () {
        when(() => mockHapticFeedbackHelper.feedback(HapticFeedbackType.light)).thenAnswer((_) => Future.value());
        return cubit;
      },
      act: (cubit) => cubit.changeChartType(BondDetailChartType.revenue),
      expect: () => [
        BondDetailState.initial().copyWith(chartType: BondDetailChartType.revenue),
      ],
      verify: (_) {
        verify(() => mockHapticFeedbackHelper.feedback(HapticFeedbackType.light)).called(1);
      },
    );
  });
}
