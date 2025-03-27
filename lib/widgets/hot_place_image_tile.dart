import 'package:flutter/material.dart';

class HotPlaceImageTile extends StatelessWidget {
  final String imageUrl;

  const HotPlaceImageTile({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.broken_image,
            size: 50,
            color: Colors.grey,
          );
        },
      ),
    );
  }
}