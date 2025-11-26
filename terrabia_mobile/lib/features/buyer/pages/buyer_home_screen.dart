import 'package:flutter/material.dart';
import 'package:terrabia_mobile/core/constant/app_colors.dart';

class BuyerHomeScreen extends StatelessWidget {
  const BuyerHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Espace Acheteur'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Espace Acheteur - À implémenter',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}