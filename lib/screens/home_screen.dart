import 'package:flutter/material.dart';
import 'package:test_f/components/custom_card.dart';
import 'package:test_f/design_system/colors.dart';
import 'package:test_f/design_system/text_style.dart';

const imageUrl =
    'https://images.unsplash.com/photo-1546868871-7041f2a55e12?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  Future<void> handlePress() async {
    setState(() => isLoading = true);
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(backgroundColor: AppColors.backgroundColor, elevation: 0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Text('Products', style: AppTextStyle.productTitle),
            ),
            SizedBox(
              height: 450,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CustomCard(
                    imageUrl: imageUrl,
                    onPressed: () {},
                    onTap: () {},
                    isLoading: isLoading,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
