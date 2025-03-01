import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../domain/entities/bond_detail.dart';

class IssuerDetailsSection extends StatelessWidget {
  final IssuerDetails issuerDetails;

  const IssuerDetailsSection({
    Key? key,
    required this.issuerDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.business_outlined,
                  size: 24,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Issuer Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _buildDetailsList(),
      ],
    );
  }

  Widget _buildDetailsList() {
    final List<Map<String, dynamic>> details = [
      {
        'label': 'Issuer Name',
        'value': issuerDetails.issuerName,
        'icon': Icons.apartment,
        'color': Colors.blue.shade700
      },
      {
        'label': 'Type of Issuer',
        'value': issuerDetails.typeOfIssuer,
        'icon': Icons.category,
        'color': Colors.purple.shade700
      },
      {'label': 'Sector', 'value': issuerDetails.sector, 'icon': Icons.pie_chart, 'color': Colors.teal.shade700},
      {'label': 'Industry', 'value': issuerDetails.industry, 'icon': Icons.domain, 'color': Colors.brown.shade700},
      {
        'label': 'Issuer Nature',
        'value': issuerDetails.issuerNature,
        'icon': Icons.account_balance,
        'color': Colors.green.shade700
      },
      {
        'label': 'Corporate Identity Number (CIN)',
        'value': issuerDetails.cin,
        'icon': Icons.numbers,
        'color': Colors.deepOrange.shade700
      },
      if (issuerDetails.leadManager != null &&
          issuerDetails.leadManager!.isNotEmpty &&
          issuerDetails.leadManager != "-")
        {
          'label': 'Lead Manager',
          'value': issuerDetails.leadManager!,
          'icon': Icons.person,
          'color': Colors.indigo.shade700
        },
      {
        'label': 'Registrar',
        'value': issuerDetails.registrar,
        'icon': Icons.assignment,
        'color': Colors.amber.shade800
      },
      {
        'label': 'Debenture Trustee',
        'value': issuerDetails.trustee,
        'icon': Icons.security,
        'color': Colors.red.shade700
      },
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: details.length,
          separatorBuilder: (context, index) => const Divider(
            height: 1,
            color: AppColors.border,
            indent: 16,
            endIndent: 16,
          ),
          itemBuilder: (context, index) {
            final item = details[index];

            return _buildDetailRow(
              icon: item['icon'],
              iconColor: item['color'],
              label: item['label'],
              value: item['value'],
              isLast: index == details.length - 1,
              isFirst: index == 0,
            );
          },
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    required bool isLast,
    required bool isFirst,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: isFirst ? const Radius.circular(16) : Radius.zero,
          bottom: isLast ? const Radius.circular(16) : Radius.zero,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: 22,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textMedium,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
