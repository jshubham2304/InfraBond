import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hella_infra_app/core/constants/app_style.dart';
import 'package:hella_infra_app/core/utils/utils.dart';
import 'package:hella_infra_app/presentation/bloc/bond_detail_state.dart';

import '../../core/constants/app_colors.dart';
import '../../domain/entities/bond_detail.dart';

class CompanyFinancialsChart extends StatelessWidget {
  final List<MonthlyFinancial> financials;
  final BondDetailChartType chartType;
  final Function(BondDetailChartType) onChartTypeChanged;

  const CompanyFinancialsChart({
    Key? key,
    required this.financials,
    required this.chartType,
    required this.onChartTypeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildChartHeader(),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.border.withOpacity(0.5),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildSummaryValue(
                    label: 'Average',
                    value: _getAverageValue(),
                    percentChange: null,
                  ),
                  const SizedBox(width: 24),
                  _buildSummaryValue(
                    label: 'Highest',
                    value: _getMaxValue(),
                    percentChange: 0,
                    isPositive: true,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 220,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: _getMaxValue() * 1.2,
                    barTouchData: BarTouchData(
                      enabled: true,
                      touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: Colors.white,
                        tooltipPadding: const EdgeInsets.all(12),
                        tooltipMargin: 8,
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          final month = financials[groupIndex].month;
                          final value = _getValue(groupIndex);
                          final formattedValue = Formatter.currency(value, symbol: '₹');

                          return BarTooltipItem(
                            '$month\n$formattedValue',
                            const TextStyle(
                              color: AppColors.textDark,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          );
                        },
                        tooltipRoundedRadius: 12,
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            if (value < 0 || value >= financials.length) {
                              return const SizedBox();
                            }
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(
                                financials[value.toInt()].month.substring(0, 1),
                                style: AppTextStyles.caption.copyWith(fontSize: 11, fontWeight: FontWeight.w500),
                              ),
                            );
                          },
                          reservedSize: 28,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: _getMaxValue() / 4,
                          getTitlesWidget: (value, meta) {
                            if (value == 0) {
                              return const SizedBox();
                            }
                            final formattedValue = Formatter.number(value / 1000000, decimalPlaces: 0);
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              space: 8,
                              child: Text(
                                '₹${formattedValue}M',
                                style: AppTextStyles.caption.copyWith(fontSize: 11, fontWeight: FontWeight.w500),
                              ),
                            );
                          },
                          reservedSize: 40,
                        ),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    barGroups: _createBarGroups(),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      horizontalInterval: _getMaxValue() / 4,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: AppColors.border.withOpacity(0.2),
                          strokeWidth: 1,
                          dashArray: [4, 4],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChartHeader() {
    return Row(
      children: [
        const Text(
          'COMPANY FINANCIALS',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
            letterSpacing: 0.5,
          ),
        ),
        const Spacer(),
        _buildChartTypeSelector(),
      ],
    );
  }

  Widget _buildChartTypeSelector() {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: AppColors.searchBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTypeButton(
            title: 'EBITDA',
            isSelected: chartType == BondDetailChartType.ebitda,
            onTap: () => onChartTypeChanged(BondDetailChartType.ebitda),
          ),
          _buildTypeButton(
            title: 'Revenue',
            isSelected: chartType == BondDetailChartType.revenue,
            onTap: () => onChartTypeChanged(BondDetailChartType.revenue),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : AppColors.textMedium,
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryValue({
    required String label,
    required double value,
    double? percentChange,
    bool isPositive = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textMedium,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          Formatter.currency(value, symbol: '₹'),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
        if (percentChange != null)
          Row(
            children: [
              Icon(
                isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                color: isPositive ? Colors.green : Colors.red,
                size: 14,
              ),
              const SizedBox(width: 2),
              Text(
                '${percentChange.toStringAsFixed(1)}%',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isPositive ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
      ],
    );
  }

  List<BarChartGroupData> _createBarGroups() {
    return List.generate(financials.length, (index) {
      final value = _getValue(index);
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: value,
            color: _getBarColor(),
            width: 16,
            borderRadius: BorderRadius.circular(4),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: _getMaxValue() * 1.2,
              color: AppColors.lightBackground,
            ),
          ),
        ],
      );
    });
  }

  double _getValue(int index) {
    if (chartType == BondDetailChartType.ebitda) {
      return financials[index].ebitda;
    } else {
      return financials[index].revenue;
    }
  }

  double _getMaxValue() {
    if (chartType == BondDetailChartType.ebitda) {
      return financials.map((f) => f.ebitda).reduce((a, b) => a > b ? a : b);
    } else {
      return financials.map((f) => f.revenue).reduce((a, b) => a > b ? a : b);
    }
  }

  double _getAverageValue() {
    if (chartType == BondDetailChartType.ebitda) {
      return financials.map((f) => f.ebitda).reduce((a, b) => a + b) / financials.length;
    } else {
      return financials.map((f) => f.revenue).reduce((a, b) => a + b) / financials.length;
    }
  }

  Color _getBarColor() {
    return chartType == BondDetailChartType.ebitda ? AppColors.ebitda : AppColors.revenue;
  }
}
