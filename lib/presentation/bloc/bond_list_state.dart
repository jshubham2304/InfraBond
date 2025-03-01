import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/bond.dart';

part 'bond_list_state.freezed.dart';

@freezed
class BondListState with _$BondListState {
  const factory BondListState({
    @Default(false) bool isLoading,
    @Default([]) List<Bond> bonds, // All bonds (unfiltered)
    @Default([]) List<Bond> filteredBonds, // Bonds filtered by search
    @Default('') String searchTerm,
    String? errorMessage,
  }) = _BondListState;

  factory BondListState.initial() => const BondListState();
}
