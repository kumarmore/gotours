import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import flutter_svg
import '../widgets/custom_text.dart';
import '../widgets/transaction_item.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with back button and title
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, size: 30),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 16),
                  const CustomText(
                    text: 'Payment Method',
                    size: 24,
                    weight: FontWeight.bold,
                    fontFamily: 'Marcellus',
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Single Payment Method Card
              Container(
                width: 600,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),

                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: SvgPicture.asset(
                    'assets/images/Debit card.svg',
                    width: 600,
                    height: 300,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Monthly Transfer Limit
              Container(
                padding: const EdgeInsets.all(16.0),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: 'Monthly transfer limit',
                          size: 16,
                          weight: FontWeight.bold,
                        ),
                        const SizedBox(height: 8),
                        const CustomText(
                          text: '\$120,000 / \$600,000',
                          size: 14,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator(
                            value: 0.2,
                            strokeWidth: 8,
                            backgroundColor: Colors.grey[200],
                            valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
                          ),
                        ),
                        const CustomText(
                          text: '20%',
                          size: 14,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // History Section
              const CustomText(
                text: 'History',
                size: 18,
                weight: FontWeight.bold,
              ),
              const SizedBox(height: 12),
              const TransactionItem(
                imagePath: 'assets/images/portugal.png',
                title: 'Winter in Portugal',
                subtitle: 'Lisbon',
                amount: 500,
              ),
              const SizedBox(height: 12),
              const TransactionItem(
                imagePath: 'assets/images/Sesimbra e Arrabida.png',
                title: 'Sesimbra e Arrábida',
                subtitle: 'Setúbal, Lisbon',
                amount: -3000,
              ),
              const SizedBox(height: 12),
              const TransactionItem(
                imagePath: 'assets/images/japan.png',
                title: 'Japan Most Unique Country',
                subtitle: 'Sesimbra, Lisbon',
                amount: 500,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}