import 'package:flutter/material.dart';
import 'package:test_f/components/custom_button.dart';
import 'package:test_f/components/product_image.dart';
import 'package:test_f/design_system/colors.dart';
import 'package:test_f/design_system/text_style.dart';

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onPressed;
  final VoidCallback onTap;
  final bool isLoading;

  const CustomCard({
    super.key,
    required this.imageUrl,
    required this.onPressed,
    required this.onTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final cardWidth = screenSize.width < 600 ? 300.0 : 350.0;
    final cardPadding = screenSize.width < 600 ? 10.0 : 20.0;
    final imageSize = screenSize.width < 600 ? 150.0 : 200.0;

    screenSize.width < 600
        ? AppTextStyle.productTitle.copyWith(fontSize: 20)
        : AppTextStyle.productTitle;
    return SizedBox(
      width: cardWidth,
      child: Semantics(
        container: true,
        child: Card(
          color: AppColors.surfaceColor,
          elevation: 4,
          margin: EdgeInsets.all(cardPadding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child:
              isLoading
                  ? const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.surfaceColor,
                      ),
                    ),
                  )
                  : InkWell(
                    onTap: onTap,
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: screenSize.width < 600 ? 10 : 20),
                          ProductImage(
                            imageUrl: imageUrl,
                            height: imageSize,
                            width: imageSize,
                          ),
                          SizedBox(height: screenSize.width < 600 ? 5 : 10),
                          Text(
                            'Creme Desodorante Hidratante para mão Dolce 50g',
                            style: AppTextStyle.productTitle,
                          ),
                          SizedBox(height: 50),
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
      ),
    );
  }
}
