import 'package:flutter/material.dart';
import '../widgets/custom_text.dart';

class LocationCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final int? likes;
  final String? description;
  final double? price;
  final bool isBestPlace;

  const LocationCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    this.likes,
    this.description,
    this.price,
    this.isBestPlace = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isBestPlace ? 280 : null,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: isBestPlace ? const EdgeInsets.all(8.0) : const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image and price button in a Stack
          Stack(
            clipBehavior: Clip.none, // Allow the price button to overflow the image
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imagePath,
                  height: isBestPlace ? 130 : 150, // Reduced to 130 to fit within height
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    print('Failed to load image: $imagePath');
                    return const Icon(Icons.broken_image, size: 50);
                  },
                ),
              ),
              if (price != null && isBestPlace)
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CustomText(
                      text: '\$$price',
                      size: 16,
                      fontFamily: 'Gilroy-Bold',
                      color: Colors.white,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          // Title and subtitle below the image
          CustomText(
            text: title,
            size: 16,
            fontFamily: 'Gilroy-Bold',
            weight: FontWeight.bold,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.orange, size: 16),
              const SizedBox(width: 4),
              CustomText(
                text: subtitle,
                size: 14,
                fontFamily: 'Gilroy-Medium',
                color: Colors.grey,
              ),
            ],
          ),
          if (likes != null) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.favorite, color: Colors.red, size: 16),
                const SizedBox(width: 4),
                CustomText(
                  text: '$likes Likes',
                  size: 14,
                  fontFamily: 'Gilroy-Medium',
                  color: Colors.grey,
                ),
              ],
            ),
          ],
          if (description != null) ...[
            const SizedBox(height: 8),
            CustomText(
              text: description!,
              size: 14,
              fontFamily: 'Gilroy-Medium',
              color: Colors.grey,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }
}