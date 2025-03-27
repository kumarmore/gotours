import 'package:flutter/material.dart';

class ChoiceDatePersonsButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const ChoiceDatePersonsButton({
    super.key,
    required this.text,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffFF7D0D) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          // border: Border.all(color: const Color(0xffFF7D0D)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 16,
            fontFamily: 'Gilroy-Medium',
          ),
        ),
      ),
    );
  }
}