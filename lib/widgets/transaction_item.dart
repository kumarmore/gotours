import 'package:flutter/material.dart';
import '../widgets/custom_text.dart';

class TransactionItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final double amount;

  const TransactionItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          // Title and Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  size: 16,
                  weight: FontWeight.bold,
                ),
                const SizedBox(height: 4),
                CustomText(
                  text: subtitle,
                  size: 14,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          // Amount
          CustomText(
            text: amount >= 0 ? '+\$${amount.toInt()}' : '-\$${amount.abs().toInt()}',
            size: 16,
            weight: FontWeight.bold,
            color: amount >= 0 ? Colors.green : Colors.red,
          ),
        ],
      ),
    );
  }
}