import 'package:flutter/material.dart';
import 'package:test_f/design_system/colors.dart';

class ProductImage extends StatefulWidget {
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
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  bool hasError = false;

  void retryLoadImage() {
    setState(() {
      hasError = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(
      widget.imageUrl,
      height: widget.height,
      width: widget.width,
      fit: BoxFit.cover,
      errorBuilder:
          (context, error, stackTrace) => Container(
            height: widget.height,
            width: widget.width,
            color: AppColors.backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.image_not_supported),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: retryLoadImage,
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
    );
  }
}
