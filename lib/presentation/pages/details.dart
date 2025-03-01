import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hella_infra_app/core/constants/app_style.dart';
import 'package:hella_infra_app/core/injection/injection.dart';
import 'package:hella_infra_app/core/service/book_mark_service.dart';
import 'package:hella_infra_app/core/service/share_service.dart';
import 'package:hella_infra_app/core/utils/haptic_feedback.dart';
import 'package:hella_infra_app/domain/entities/bond_detail.dart';
import 'package:hella_infra_app/presentation/bloc/bond_detail_cubit.dart';
import 'package:hella_infra_app/presentation/bloc/bond_detail_state.dart';
import 'package:hella_infra_app/presentation/bloc/bookmark_cubit.dart';
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
  final HapticFeedbackHelper _hapticFeedback = getIt<HapticFeedbackHelper>();
  final ShareService _shareService = getIt<ShareService>();
  final BookmarkService _bookmarkService = getIt<BookmarkService>();
  bool _isBookmarked = false;

  @override
  void initState() {
    super.initState();
    context.read<BondDetailCubit>().loadBondDetail(widget.bondId);
    _checkBookmarkStatus();

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

  Future<void> _checkBookmarkStatus() async {
    final data = await _bookmarkService.isBookmarked(widget.bondId);
    setState(() {
      _isBookmarked = data;
    });
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
            return Column(
              children: [
                _buildAppBar(state),
                Expanded(
                  child: _buildContent(state),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildAppBar(BondDetailState state) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(_showAppBarTitle ? 0.05 : 0.0),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              _hapticFeedback.feedback(HapticFeedbackType.medium);
              Navigator.pop(context);
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.lightBackground,
                borderRadius: BorderRadius.circular(12),
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
                size: 22,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: AnimatedOpacity(
              opacity: _showAppBarTitle ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Text(
                state.bondDetail?.companyName ?? 'Bond Detail',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          _buildActionButton(
            icon: Icons.ios_share,
            onTap: () => _showShareOptions(state.bondDetail),
            tooltip: 'Share',
          ),
          const SizedBox(width: 12),
          _buildBookmarkButton(state),
          const SizedBox(width: 12),
          _buildActionButton(
            icon: Icons.copy,
            onTap: () => _copyBondDetails(state.bondDetail),
            tooltip: 'Copy ISIN',
          ),
          const SizedBox(width: 12),
          _buildActionButton(
            icon: Icons.compare_arrows,
            onTap: () => _compareBonds(state.bondDetail),
            tooltip: 'Compare',
          ),
        ],
      ),
    );
  }

  Widget _buildBookmarkButton(BondDetailState state) {
    return Tooltip(
      message: _isBookmarked ? 'Remove from bookmarks' : 'Add to bookmarks',
      child: InkWell(
        onTap: () => _toggleBookmark(state.bondDetail),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: _isBookmarked ? AppColors.primary.withOpacity(0.1) : AppColors.lightBackground,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
            border: _isBookmarked ? Border.all(color: AppColors.primary, width: 1.5) : null,
          ),
          child: Icon(
            _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
            color: _isBookmarked ? AppColors.primary : AppColors.textDark,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onTap,
    required String tooltip,
  }) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.lightBackground,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: AppColors.textDark,
            size: 20,
          ),
        ),
      ),
    );
  }

  void _showShareOptions(bondDetail) {
    if (bondDetail == null) return;

    _hapticFeedback.feedback(HapticFeedbackType.medium);

    // Show share options dialog
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Share Bond Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildShareOption(
                  icon: Icons.copy,
                  label: 'Copy Text',
                  color: Colors.blue,
                  onTap: () {
                    Navigator.pop(context);
                    _shareService.shareBondDetails(bondDetail, ShareMethod.copy);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Details copied to clipboard'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                ),
                _buildShareOption(
                  icon: Icons.picture_as_pdf,
                  label: 'PDF',
                  color: Colors.red,
                  onTap: () {
                    Navigator.pop(context);
                    _shareService.shareBondDetails(bondDetail, ShareMethod.pdf);
                  },
                ),
                _buildShareOption(
                  icon: Icons.message,
                  label: 'WhatsApp',
                  color: Colors.green,
                  onTap: () {
                    Navigator.pop(context);
                    _shareService.shareBondDetails(bondDetail, ShareMethod.whatsapp);
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildShareOption(
                  icon: Icons.email,
                  label: 'Email',
                  color: Colors.orange,
                  onTap: () {
                    Navigator.pop(context);
                    _shareService.shareBondDetails(bondDetail, ShareMethod.email);
                  },
                ),
                _buildShareOption(
                  icon: Icons.telegram,
                  label: 'Telegram',
                  color: Colors.blue.shade700,
                  onTap: () {
                    Navigator.pop(context);
                    _shareService.shareBondDetails(bondDetail, ShareMethod.telegram);
                  },
                ),
                _buildShareOption(
                  icon: Icons.more_horiz,
                  label: 'More',
                  color: Colors.purple,
                  onTap: () {
                    Navigator.pop(context);
                    _shareService.shareBondDetails(bondDetail, ShareMethod.custom);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildShareOption({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(
                color: color.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Icon(
              icon,
              color: color,
              size: 28,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _toggleBookmark(BondDetail? bondDetail) async {
    if (bondDetail == null) return;
    // ignore: unused_result
    bondDetail.copyWith(id: widget.bondId);
    final bond = bondDetail.toBond();
    await context.read<BookmarkCubit>().toggleBookmark(bond);

    setState(() {
      _isBookmarked = !_isBookmarked;
    });

    // Show confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isBookmarked ? 'Bond added to bookmarks' : 'Bond removed from bookmarks'),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: _isBookmarked ? AppColors.proIcon : AppColors.textDark,
        action: SnackBarAction(
          label: _isBookmarked ? 'VIEW' : 'UNDO',
          textColor: Colors.white,
          onPressed: () {
            if (_isBookmarked) {
              // Navigate to bookmarks view
            } else {
              // Undo removal
              _toggleBookmark(bondDetail);
            }
          },
        ),
      ),
    );
  }

  void _copyBondDetails(bondDetail) {
    if (bondDetail == null) return;

    _hapticFeedback.feedback(HapticFeedbackType.light);

    // Show options for what to copy
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Copy to Clipboard',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 20),
            _buildCopyOption(
              title: 'ISIN Number',
              value: bondDetail.isin,
              onTap: () {
                Navigator.pop(context);
                _shareService.copyToClipboard(bondDetail.isin);
                _showCopiedSnackbar('ISIN copied to clipboard');
              },
            ),
            const SizedBox(height: 12),
            _buildCopyOption(
              title: 'Company Name',
              value: bondDetail.companyName,
              onTap: () {
                Navigator.pop(context);
                _shareService.copyToClipboard(bondDetail.companyName);
                _showCopiedSnackbar('Company name copied to clipboard');
              },
            ),
            const SizedBox(height: 12),
            _buildCopyOption(
              title: 'Issuer Details',
              value: bondDetail.issuerDetails.issuerName,
              onTap: () {
                Navigator.pop(context);
                final issuerDetails = '''
Issuer Name: ${bondDetail.issuerDetails.issuerName}
Type of Issuer: ${bondDetail.issuerDetails.typeOfIssuer}
Sector: ${bondDetail.issuerDetails.sector}
Industry: ${bondDetail.issuerDetails.industry}
CIN: ${bondDetail.issuerDetails.cin}
''';
                _shareService.copyToClipboard(issuerDetails);
                _showCopiedSnackbar('Issuer details copied to clipboard');
              },
            ),
            const SizedBox(height: 12),
            _buildCopyOption(
              title: 'All Bond Details',
              value: 'Complete information about the bond',
              onTap: () {
                Navigator.pop(context);
                _shareService.shareBondDetails(bondDetail, ShareMethod.copy);
                _showCopiedSnackbar('All bond details copied to clipboard');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCopyOption({
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.lightBackground,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.border,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textMedium,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.content_copy,
              color: AppColors.primary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _showCopiedSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _compareBonds(bondDetail) {
    if (bondDetail == null) return;

    _hapticFeedback.feedback(HapticFeedbackType.medium);

    // Show dialogue to select bonds for comparison
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Compare with other bonds',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Select bonds to compare with this one',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textMedium,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Feature coming soon!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Close'),
              ),
            ),
          ],
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
            Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 100,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 100,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              height: 350,
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
              _hapticFeedback.feedback(HapticFeedbackType.medium);
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
    return ListView(
      controller: _scrollController,
      padding: const EdgeInsets.only(bottom: 24),
      physics: const BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: BondDetailHeader(
            bondDetail: bondDetail,
            activeTab: state.activeTab,
            onTabChanged: (tab) {
              _hapticFeedback.feedback(HapticFeedbackType.light);
              context.read<BondDetailCubit>().changeTab(tab);
            },
            hapticFeedback: _hapticFeedback,
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
    );
  }

  Widget _buildAnalysisTab(BondDetailState state, bondDetail) {
    return Column(
      key: const ValueKey('analysis'),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: CompanyFinancialsChart(
            financials: bondDetail.financials,
            chartType: state.chartType,
            onChartTypeChanged: (type) {
              _hapticFeedback.feedback(HapticFeedbackType.light);
              context.read<BondDetailCubit>().changeChartType(type);
            },
          ),
        ),
        const SizedBox(height: 24),
        IssuerDetailsSection(
          issuerDetails: bondDetail.issuerDetails,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
