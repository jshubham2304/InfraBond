import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hella_infra_app/core/utils/haptic_feedback.dart';
import 'package:hella_infra_app/domain/usecases/get_bond_details_use_case.dart';
import 'package:injectable/injectable.dart';

import 'bond_detail_state.dart';

@injectable
class BondDetailCubit extends Cubit<BondDetailState> {
  final GetBondDetail getBondDetail;
  final HapticFeedbackHelper hapticFeedback;

  BondDetailCubit({
    required this.getBondDetail,
    required this.hapticFeedback,
  }) : super(BondDetailState.initial());

  Future<void> loadBondDetail(String bondId) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await getBondDetail.call(BondDetailParams(bondId: bondId));

    result.fold(
      (failure) {
        hapticFeedback.feedback(HapticFeedbackType.error);
        emit(state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        ));
      },
      (bondDetail) {
        hapticFeedback.feedback(HapticFeedbackType.light);
        emit(state.copyWith(
          isLoading: false,
          bondDetail: bondDetail,
          errorMessage: null,
        ));
      },
    );
  }

  void changeTab(BondDetailTab tab) {
    hapticFeedback.feedback(HapticFeedbackType.medium);
    emit(state.copyWith(activeTab: tab));
  }

  void changeChartType(BondDetailChartType chartType) {
    hapticFeedback.feedback(HapticFeedbackType.light);
    emit(state.copyWith(chartType: chartType));
  }
}
