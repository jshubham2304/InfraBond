import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hella_infra_app/core/constants/app_style.dart';
import 'package:hella_infra_app/core/utils/animation.dart';
import 'package:hella_infra_app/core/utils/haptic_feedback.dart';
import 'package:hella_infra_app/presentation/bloc/bond_list_cubit.dart';
import 'package:hella_infra_app/presentation/bloc/bond_list_state.dart';
import 'package:hella_infra_app/presentation/pages/details.dart';
import 'package:hella_infra_app/presentation/widget/bond_list_item.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/constants/app_colors.dart';
import '../../domain/entities/bond.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _isSearchFocused = false;
  late AnimationController _searchAnimationController;
  late Animation<double> _searchAnimation;

  @override
  void initState() {
    super.initState();
    context.read<BondListCubit>().loadBonds();

    // Search animation setup
    _searchAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _searchAnimation = CurvedAnimation(
      parent: _searchAnimationController,
      curve: Curves.easeInOut,
    );

    _searchFocusNode.addListener(() {
      setState(() {
        _isSearchFocused = _searchFocusNode.hasFocus;
      });

      if (_searchFocusNode.hasFocus) {
        _searchAnimationController.forward();
      } else {
        _searchAnimationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _searchAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            _buildSearchBar(),
            Expanded(
              child: BlocBuilder<BondListCubit, BondListState>(
                builder: (context, state) {
                  if (state.isLoading && state.filteredBonds.isEmpty) {
                    return _buildLoadingShimmer();
                  } else if (state.errorMessage != null && state.filteredBonds.isEmpty) {
                    return _buildErrorState(state.errorMessage!);
                  } else if (state.filteredBonds.isEmpty) {
                    return _buildEmptyState();
                  } else {
                    return _buildBondsList(state.filteredBonds, state.searchTerm);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          const Text(
            'Hella Infra',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Bonds',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: AnimatedBuilder(
        animation: _searchAnimation,
        builder: (context, child) {
          return Container(
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _isSearchFocused ? AppColors.primary : Colors.transparent,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: _isSearchFocused ? AppColors.primary.withOpacity(0.1) : Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              focusNode: _searchFocusNode,
              style: AppTextStyles.body1,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: 'Search for bonds by name, ISIN or tags',
                hintStyle: AppTextStyles.searchHint,
                prefixIcon: Icon(
                  Icons.search,
                  color: _isSearchFocused ? AppColors.primary : AppColors.textLight,
                  size: 20,
                ),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, size: 18),
                        onPressed: () {
                          GetIt.instance<HapticFeedbackHelper>().feedback(HapticFeedbackType.light);
                          _searchController.clear();
                          context.read<BondListCubit>().clearSearch();
                          FocusScope.of(context).unfocus();
                        },
                      )
                    : null,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (value) {
                // Perform search on every character change
                context.read<BondListCubit>().searchBonds(value);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildResultsLabel() {
    return BlocBuilder<BondListCubit, BondListState>(
      builder: (context, state) {
        String labelText = 'BONDS';
        if (state.searchTerm.isNotEmpty) {
          labelText = 'SEARCH RESULTS';
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Text(
                labelText,
                style: AppTextStyles.sectionHeader,
              ),
              const SizedBox(width: 8),
              AnimatedOpacity(
                opacity: state.isLoading ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 150),
                child: const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                '${state.filteredBonds.length} results',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textMedium,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBondsList(List<Bond> bonds, String searchTerm) {
    return Column(
      children: [
        _buildResultsLabel(),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 16),
            itemCount: bonds.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final bond = bonds[index];
              return StaggeredListItemAnimation(
                index: index,
                child: BondListItem(
                  bond: bond,
                  onTap: () => _navigateToBondDetail(bond),
                  hapticFeedback: GetIt.instance<HapticFeedbackHelper>(),
                  searchTerm: searchTerm,
                  index: index,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLoadingShimmer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 120,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ListView.builder(
                itemCount: 8,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, __) => _buildShimmerItem(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 150,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 100,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ],
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
              GetIt.instance<HapticFeedbackHelper>().feedback(HapticFeedbackType.medium);
              context.read<BondListCubit>().loadBonds();
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

  Widget _buildEmptyState() {
    final BondListState state = context.watch<BondListCubit>().state;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            state.searchTerm.isNotEmpty ? Icons.search_off : Icons.list_alt,
            color: AppColors.textLight,
            size: 64,
          ),
          const SizedBox(height: 16),
          Text(
            state.searchTerm.isNotEmpty ? 'No results found' : 'No bonds available',
            style: AppTextStyles.heading3,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              state.searchTerm.isNotEmpty
                  ? 'Try searching with a different term'
                  : 'Check back later for available bonds',
              style: AppTextStyles.body2.copyWith(
                color: AppColors.textMedium,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          if (state.searchTerm.isNotEmpty) ...[
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                GetIt.instance<HapticFeedbackHelper>().feedback(HapticFeedbackType.medium);
                _searchController.clear();
                _searchFocusNode.unfocus();
                context.read<BondListCubit>().clearSearch();
              },
              icon: const Icon(Icons.clear),
              label: const Text('Clear Search'),
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
        ],
      ),
    );
  }

  void _navigateToBondDetail(Bond bond) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => BondDetailPage(bondId: bond.code),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}
