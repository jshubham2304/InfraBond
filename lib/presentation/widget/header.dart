import 'package:flutter/material.dart';
import 'package:hella_infra_app/core/utils/haptic_feedback.dart';
import 'package:hella_infra_app/presentation/bloc/bond_detail_state.dart';

import '../../core/constants/app_colors.dart';
import '../../domain/entities/bond_detail.dart';

class BondDetailHeader extends StatefulWidget {
  final BondDetail bondDetail;
  final BondDetailTab activeTab;
  final Function(BondDetailTab) onTabChanged;
  final HapticFeedbackHelper hapticFeedback;

  const BondDetailHeader({
    Key? key,
    required this.bondDetail,
    required this.activeTab,
    required this.onTabChanged,
    required this.hapticFeedback,
  }) : super(key: key);

  @override
  State<BondDetailHeader> createState() => _BondDetailHeaderState();
}

class _BondDetailHeaderState extends State<BondDetailHeader> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.activeTab == BondDetailTab.analysis ? 0 : 1,
    );

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        widget.hapticFeedback.feedback(HapticFeedbackType.medium);
        widget.onTabChanged(_tabController.index == 0 ? BondDetailTab.analysis : BondDetailTab.prosAndCons);
      }
    });
  }

  @override
  void didUpdateWidget(BondDetailHeader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.activeTab != widget.activeTab) {
      _tabController.animateTo(widget.activeTab == BondDetailTab.analysis ? 0 : 1);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCompanyInfo(),
        const SizedBox(height: 20),
        _buildTabs(),
      ],
    );
  }

  Widget _buildCompanyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildLogo(),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                widget.bondDetail.companyName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                  letterSpacing: -0.5,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(
              color: AppColors.border.withOpacity(0.5),
              width: 1,
            ),
          ),
          child: Text(
            widget.bondDetail.description,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppColors.textMedium,
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildIsinTag(),
            const SizedBox(width: 8),
            _buildStatusTag(),
          ],
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.lightBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: Center(
        child: _buildLogoFallback(),
      ),
    );
  }

  Widget _buildLogoFallback() {
    // Extract initials from company name
    final nameWords = widget.bondDetail.companyName.split(' ');
    String initials = '';
    if (nameWords.isNotEmpty) {
      initials = nameWords[0][0];
      if (nameWords.length > 1) {
        for (int i = 1; i < nameWords.length; i++) {
          if (nameWords[i].isNotEmpty && !nameWords[i].startsWith('(')) {
            initials += nameWords[i][0];
            if (initials.length >= 2) break;
          }
        }
      }
    }

    return Text(
      initials.toUpperCase(),
      style: const TextStyle(
        color: AppColors.orangeAccent,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Widget _buildIsinTag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.2),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.tag,
            size: 16,
            color: AppColors.primary,
          ),
          const SizedBox(width: 6),
          Text(
            'ISIN: ${widget.bondDetail.isin}',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusTag() {
    final Color statusColor = widget.bondDetail.isActive ? AppColors.active : Colors.red;
    final IconData statusIcon = widget.bondDetail.isActive ? Icons.check_circle : Icons.cancel;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: statusColor.withOpacity(0.2),
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            statusIcon,
            size: 16,
            color: statusColor,
          ),
          const SizedBox(width: 6),
          Text(
            widget.bondDetail.isActive ? 'ACTIVE' : 'INACTIVE',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: statusColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.white,
            unselectedLabelColor: AppColors.textMedium,
            labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            padding: const EdgeInsets.all(6),
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.analytics,
                      size: 16,
                      color: _tabController.index == 0 ? Colors.white : AppColors.textMedium,
                    ),
                    const SizedBox(width: 8),
                    const Text('Analysis'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.compare_arrows,
                      size: 16,
                      color: _tabController.index == 1 ? Colors.white : AppColors.textMedium,
                    ),
                    const SizedBox(width: 8),
                    const Text('Pros & Cons'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
