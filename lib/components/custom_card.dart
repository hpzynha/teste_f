import 'package:flutter/material.dart';
import 'package:test_f/components/custom_button.dart';
import 'package:test_f/components/product_image.dart';
import 'package:test_f/design_system/colors.dart';
import 'package:test_f/design_system/text_style.dart';

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onPressed;
  final VoidCallback onTap;

  const CustomCard({
    super.key,
    required this.imageUrl,
    required this.onPressed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      child: Card(
        color: AppColors.surfaceColor,
        elevation: 4,
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                ProductImage(imageUrl: imageUrl, height: 200, width: 200),
                SizedBox(height: 10),
                Text(
                  'Creme Desodorante Hidratante para mão Dolce 50g',
                  style: AppTextStyle.productTitle,
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('R\$ 15,99', style: AppTextStyle.price),
                    CustomButton(onPressed: onPressed),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
