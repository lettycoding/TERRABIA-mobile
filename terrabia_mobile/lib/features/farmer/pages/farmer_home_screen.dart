import 'package:terrabia_mobile/core/constant/app_colors.dart';
import 'package:flutter/material.dart';


class FarmerHomeScreen extends StatelessWidget {
  const FarmerHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Espace Agriculteur'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Espace Agriculteur - À implémenter',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}