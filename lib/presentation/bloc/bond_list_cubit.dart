import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hella_infra_app/core/utils/haptic_feedback.dart';
import 'package:hella_infra_app/domain/usecases/get_bond_use_case.dart';
import 'package:injectable/injectable.dart';

import 'bond_list_state.dart';

@injectable
class BondListCubit extends Cubit<BondListState> {
  final GetBondList getBondList;
  final HapticFeedbackHelper hapticFeedback;

  BondListCubit({
    required this.getBondList,
    required this.hapticFeedback,
  }) : super(BondListState.initial());

  Future<void> loadBonds() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await getBondList.call();

    result.fold(
      (failure) {
        hapticFeedback.feedback(HapticFeedbackType.error);
        emit(state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        ));
      },
      (bonds) {
        hapticFeedback.feedback(HapticFeedbackType.light);
        emit(state.copyWith(
          isLoading: false,
          bonds: bonds,
          filteredBonds: bonds,
          errorMessage: null,
        ));
      },
    );
  }

  // Real-time search as the user types
  Future<void> searchBonds(String searchTerm) async {
    if (searchTerm.trim().isEmpty) {
      await clearSearch();
    }

    // First, indicate we're processing the search
    emit(state.copyWith(
      isLoading: true,
      searchTerm: searchTerm,
    ));

    // Perform client-side filtering
    final lowercaseSearchTerm = searchTerm.toLowerCase();
    final filteredBonds = state.bonds.where((bond) {
      // Check all text fields for matches
      return bond.code.toLowerCase().contains(lowercaseSearchTerm) ||
          bond.companyName.toLowerCase().contains(lowercaseSearchTerm) ||
          bond.rating.toLowerCase().contains(lowercaseSearchTerm) ||
          bond.tags.any((tag) => tag.toLowerCase().contains(lowercaseSearchTerm));
    }).toList();

    // Update state with filtered results
    emit(state.copyWith(
      isLoading: false,
      filteredBonds: filteredBonds,
      searchTerm: searchTerm,
    ));

    // Provide haptic feedback after search completes
    hapticFeedback.feedback(HapticFeedbackType.light);
  }

  Future<void> clearSearch() async {
    emit(state.copyWith(
      searchTerm: '',
      filteredBonds: state.bonds,
    ));
  }
}
