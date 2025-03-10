import 'package:flutter/material.dart';
import 'package:test_f/design_system/colors.dart';

class ProductImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  const ProductImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: height,
      width: width,
      fit: BoxFit.cover,
      errorBuilder:
          (context, error, stackTrace) => Container(
            height: 200,
            width: 200,
            color: AppColors.backgroundColor,
            child: const Icon(Icons.image_not_supported),
          ),
    );
  }
}
