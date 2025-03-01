import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hella_infra_app/domain/entities/bond_detail.dart';

part 'bond_detail_state.freezed.dart';

enum BondDetailTab { analysis, prosAndCons }

enum BondDetailChartType { ebitda, revenue }

@freezed
class BondDetailState with _$BondDetailState {
  const factory BondDetailState({
    @Default(false) bool isLoading,
    BondDetail? bondDetail,
    @Default(BondDetailTab.analysis) BondDetailTab activeTab,
    @Default(BondDetailChartType.revenue) BondDetailChartType chartType,
    String? errorMessage,
  }) = _BondDetailState;

  factory BondDetailState.initial() => const BondDetailState();
}
