import 'package:flutter/material.dart';

class UserButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const UserButton({
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
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffFF7D0D) : Colors.white,
          borderRadius: BorderRadius.circular(26),
          // border: Border.all(color: const Color(0xffFF7D0D)),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 16,
              fontFamily: 'Gilroy-bold',
            ),
          ),
        ),
      ),
    );
  }
}