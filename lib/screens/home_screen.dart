import 'package:flutter/material.dart';
import 'package:test_f/components/custom_card.dart';
import 'package:test_f/design_system/colors.dart';

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
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          CustomCard(
            imageUrl: imageUrl,
            onPressed: () {},
            onTap: () {},
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }
}
