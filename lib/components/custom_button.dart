import 'package:flutter/material.dart';
import 'package:test_f/design_system/colors.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.onPressed});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isLoading = false;

  void handlePress() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));
    widget.onPressed();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        iconColor: Colors.white,
        iconSize: 30,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        minimumSize: const Size(60, 50),
      ),
      onPressed: isLoading ? null : handlePress,
      child:
          isLoading
              ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.surfaceColor,
                  ),
                ),
              )
              : const Icon(Icons.shopping_bag_outlined),
    );
  }
}
