import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hella_infra_app/presentation/bloc/bond_list_cubit.dart';
import 'package:hella_infra_app/presentation/bloc/bond_list_state.dart';
import 'package:hella_infra_app/core/utils/haptic_feedback.dart';
import 'package:hella_infra_app/domain/usecases/get_bond_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:hella_infra_app/domain/entities/bond.dart';

class MockGetBondList extends Mock implements GetBondList {}

class MockHapticFeedbackHelper extends Mock implements HapticFeedbackHelper {}

void main() {
  late BondListCubit cubit;
  late MockGetBondList mockGetBondList;
  late MockHapticFeedbackHelper mockHapticFeedbackHelper;

  setUp(() {
    mockGetBondList = MockGetBondList();
    mockHapticFeedbackHelper = MockHapticFeedbackHelper();
    cubit = BondListCubit(
      getBondList: mockGetBondList,
      hapticFeedback: mockHapticFeedbackHelper,
    );
  });

  group('BondListCubit', () {
    const testBond =
        Bond(id: '1', companyName: 'Test Bond', code: 'TST', rating: 'A+', tags: [], logoUrl: '', isActive: true);
    final testBonds = [testBond];

    test('should emit loading then loaded state when fetching bonds successfully', () async {
      when(() => mockGetBondList.call()).thenAnswer((_) async => Right(testBonds));
      when(() => mockHapticFeedbackHelper.feedback(HapticFeedbackType.light)).thenAnswer((_) => Future.value());

      final expectedStates = [
        BondListState.initial().copyWith(isLoading: true),
        BondListState.initial().copyWith(
          isLoading: false,
          bonds: testBonds,
          filteredBonds: testBonds,
        ),
      ];

      expectLater(cubit.stream, emitsInOrder(expectedStates));
      await cubit.loadBonds();
    });
  });
}
