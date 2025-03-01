import 'package:flutter/material.dart';
import 'package:hella_infra_app/core/constants/app_style.dart';
import 'package:hella_infra_app/core/utils/haptic_feedback.dart';
import 'package:hella_infra_app/presentation/widget/highlight_text.dart';

import '../../core/constants/app_colors.dart';
import '../../domain/entities/bond.dart';

class BondListItem extends StatefulWidget {
  final Bond bond;
  final VoidCallback onTap;
  final HapticFeedbackHelper hapticFeedback;
  final String searchTerm;
  final int index;

  const BondListItem({
    Key? key,
    required this.bond,
    required this.onTap,
    required this.hapticFeedback,
    this.searchTerm = '',
    required this.index,
  }) : super(key: key);

  @override
  State<BondListItem> createState() => _BondListItemState();
}

class _BondListItemState extends State<BondListItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        );
      },
      child: GestureDetector(
        onTapDown: (_) {
          _controller.forward();
          setState(() => _isPressed = true);
        },
        onTapUp: (_) {
          _controller.reverse();
          setState(() => _isPressed = false);
        },
        onTapCancel: () {
          _controller.reverse();
          setState(() => _isPressed = false);
        },
        onTap: () {
          widget.hapticFeedback.feedback(HapticFeedbackType.medium);
          widget.onTap();
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: _isPressed ? AppColors.primary.withOpacity(0.2) : Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(
              color: _isPressed ? AppColors.primary.withOpacity(0.3) : Colors.transparent,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                _buildLogo(),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: HighlightedText(
                              text: widget.bond.code,
                              highlightText: widget.searchTerm,
                              style: AppTextStyles.bondCode,
                              highlightStyle: AppTextStyles.bondCode.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                                backgroundColor: AppColors.primary.withOpacity(0.1),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 4),
                          _buildRatingChip(),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.chevron_right,
                            color: AppColors.textLight,
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      HighlightedText(
                        text: widget.bond.companyName,
                        highlightText: widget.searchTerm,
                        style: AppTextStyles.bondCompany,
                        highlightStyle: AppTextStyles.bondCompany.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                          backgroundColor: AppColors.primary.withOpacity(0.1),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      _buildTags(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.lightBackground,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: _buildLogoFallback(),
      ),
    );
  }

  Widget _buildLogoFallback() {
    // Extract initials from company name
    final nameWords = widget.bond.companyName.split(' ');
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
        fontSize: 16,
      ),
    );
  }

  Widget _buildRatingChip() {
    Color chipColor;

    // Determine color based on rating
    if (widget.bond.rating.startsWith('AAA')) {
      chipColor = Colors.green;
    } else if (widget.bond.rating.startsWith('AA')) {
      chipColor = Colors.blue;
    } else if (widget.bond.rating.startsWith('A')) {
      chipColor = Colors.teal;
    } else if (widget.bond.rating.startsWith('BBB')) {
      chipColor = Colors.amber;
    } else if (widget.bond.rating.startsWith('BB')) {
      chipColor = Colors.orange;
    } else {
      chipColor = Colors.red;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: chipColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: chipColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: HighlightedText(
        text: widget.bond.rating,
        highlightText: widget.searchTerm,
        style: TextStyle(
          color: chipColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        highlightStyle: TextStyle(
          color: AppColors.primary,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          backgroundColor: AppColors.primary.withOpacity(0.1),
        ),
      ),
    );
  }

  Widget _buildTags() {
    if (widget.bond.tags.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 22,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.bond.tags.length,
        separatorBuilder: (context, index) => const SizedBox(width: 6),
        itemBuilder: (context, index) {
          final tag = widget.bond.tags[index];
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
            ),
            child: HighlightedText(
              text: tag,
              highlightText: widget.searchTerm,
              style: const TextStyle(
                color: AppColors.textMedium,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
              highlightStyle: TextStyle(
                color: AppColors.primary,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                backgroundColor: AppColors.primary.withOpacity(0.1),
              ),
            ),
          );
        },
      ),
    );
  }
}
