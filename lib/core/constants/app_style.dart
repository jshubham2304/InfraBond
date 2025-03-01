import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  // Headings
  static TextStyle heading1 = GoogleFonts.inter(
      textStyle: const TextStyle(
    fontFamily: 'Inter',
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  ));

  static TextStyle heading2 = GoogleFonts.inter(
      textStyle: const TextStyle(
    fontFamily: 'Inter',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  ));

  static TextStyle heading3 = GoogleFonts.inter(
      textStyle: const TextStyle(
    fontFamily: 'Inter',
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  ));

  // Body text
  static TextStyle body1 = GoogleFonts.inter(
      textStyle: const TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
  ));

  static TextStyle body1Medium = GoogleFonts.inter(
      textStyle: const TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  ));

  static TextStyle body2 = GoogleFonts.inter(
      textStyle: const TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textDark,
  ));

  static TextStyle body2Medium = GoogleFonts.inter(
      textStyle: const TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  ));

  // Caption and labels
  static TextStyle caption = GoogleFonts.inter(
      textStyle: const TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textLight,
  ));

  static TextStyle captionMedium = GoogleFonts.inter(
      textStyle: const TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textLight,
  ));

  // Specialized text styles
  static TextStyle searchHint = GoogleFonts.inter(
      textStyle: const TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textLight,
  ));

  static TextStyle bondCode = GoogleFonts.inter(
      textStyle: const TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  ));

  static TextStyle bondRating = GoogleFonts.inter(
      textStyle: const TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textLight,
  ));

  static TextStyle bondCompany = GoogleFonts.inter(
      textStyle: const TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textLight,
  ));

  static TextStyle statusLabel = GoogleFonts.inter(
      textStyle: const TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.active,
  ));

  static TextStyle tabLabel = GoogleFonts.inter(
      textStyle: const TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  ));

  static TextStyle sectionHeader = GoogleFonts.inter(
      textStyle: const TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textLight,
    letterSpacing: 0.5,
  ));

  static TextStyle detailLabel = GoogleFonts.inter(
      textStyle: const TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  ));

  static TextStyle detailValue = GoogleFonts.inter(
      textStyle: const TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textDark,
  ));
}
