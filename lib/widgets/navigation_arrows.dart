import 'package:flutter/material.dart';

class NavigationArrows extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const NavigationArrows({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: onPrevious,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(48, 48),
          ),
          child: const Icon(Icons.arrow_left_rounded, color: Colors.white, size: 50),
        ),
        Row(
          children: List.generate(
            totalPages,
                (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: currentPage == index ? 8 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: currentPage == index ? Colors.orange : Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: onNext,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(48, 48),
          ),
          child: const Icon(Icons.arrow_right_rounded, color: Colors.white, size: 50),
        ),
      ],
    );
  }
}