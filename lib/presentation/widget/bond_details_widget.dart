import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hella_infra_app/core/constants/app_style.dart';
import 'package:hella_infra_app/core/injection/injection.dart';
import 'package:hella_infra_app/core/utils/haptic_feedback.dart';
import 'package:hella_infra_app/presentation/bloc/bond_detail_cubit.dart';
import 'package:hella_infra_app/presentation/bloc/bond_detail_state.dart';
import 'package:hella_infra_app/presentation/widget/bonds_cons.dart';
import 'package:hella_infra_app/presentation/widget/company_finanical_charts.dart';
import 'package:hella_infra_app/presentation/widget/header.dart';
import 'package:hella_infra_app/presentation/widget/issue_details.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/constants/app_colors.dart';

class BondDetailPage extends StatefulWidget {
  final String bondId;

  const BondDetailPage({
    Key? key,
    required this.bondId,
  }) : super(key: key);

  @override
  State<BondDetailPage> createState() => _BondDetailPageState();
}

class _BondDetailPageState extends State<BondDetailPage> with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  bool _showAppBarTitle = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    context.read<BondDetailCubit>().loadBondDetail(widget.bondId);

    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    _animationController.forward();
  }

  void _onScroll() {
    if (_scrollController.offset > 120 && !_showAppBarTitle) {
      setState(() {
        _showAppBarTitle = true;
      });
    } else if (_scrollController.offset <= 120 && _showAppBarTitle) {
      setState(() {
        _showAppBarTitle = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<BondDetailCubit, BondDetailState>(
          builder: (context, state) {
            return NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    pinned: true,
                    floating: false,
                    elevation: _showAppBarTitle ? 2 : 0,
                    backgroundColor: AppColors.background,
                    expandedHeight: _showAppBarTitle ? 60 : 0,
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: AppColors.textDark,
                          size: 20,
                        ),
                      ),
                      onPressed: () {
                        getIt<HapticFeedbackHelper>().feedback(HapticFeedbackType.medium);
                        Navigator.pop(context);
                      },
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      title: AnimatedOpacity(
                        opacity: _showAppBarTitle ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 200),
                        child: Text(
                          state.bondDetail?.companyName ?? 'Bond Detail',
                          style: const TextStyle(
                            color: AppColors.textDark,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      centerTitle: true,
                      titlePadding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ];
              },
              body: _buildContent(state),
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(BondDetailState state) {
    if (state.isLoading) {
      return _buildLoadingState();
    } else if (state.errorMessage != null) {
      return _buildErrorState(state.errorMessage!);
    } else if (state.bondDetail != null) {
      return FadeTransition(
        opacity: _fadeAnimation,
        child: _buildDetailContent(state),
      );
    } else {
      return const Center(
        child: Text('No data available'),
      );
    }
  }

  Widget _buildLoadingState() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: 150,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: AppColors.orangeAccent,
            size: 64,
          ),
          const SizedBox(height: 16),
          Text(
            'An error occurred',
            style: AppTextStyles.heading3,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              message,
              style: AppTextStyles.body2.copyWith(
                color: AppColors.textMedium,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              getIt<HapticFeedbackHelper>().feedback(HapticFeedbackType.medium);
              context.read<BondDetailCubit>().loadBondDetail(widget.bondId);
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Try Again'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailContent(BondDetailState state) {
    final bondDetail = state.bondDetail!;
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 8, bottom: 24),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: BondDetailHeader(
              bondDetail: bondDetail,
              activeTab: state.activeTab,
              onTabChanged: (tab) {
                getIt<HapticFeedbackHelper>().feedback(HapticFeedbackType.light);
                context.read<BondDetailCubit>().changeTab(tab);
              },
              hapticFeedback: getIt<HapticFeedbackHelper>(),
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.05, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
              );
            },
            child: state.activeTab == BondDetailTab.analysis
                ? _buildAnalysisTab(state, bondDetail)
                : BondProsCons(
                    pros: bondDetail.pros,
                    cons: bondDetail.cons,
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnalysisTab(BondDetailState state, bondDetail) {
    return Column(
      key: const ValueKey('analysis'),
      children: [
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: CompanyFinancialsChart(
              financials: bondDetail.financials,
              chartType: state.chartType,
              onChartTypeChanged: (type) {
                getIt<HapticFeedbackHelper>().feedback(HapticFeedbackType.light);
                context.read<BondDetailCubit>().changeChartType(type);
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: IssuerDetailsSection(
              issuerDetails: bondDetail.issuerDetails,
            ),
          ),
        ),
      ],
    );
  }
}
