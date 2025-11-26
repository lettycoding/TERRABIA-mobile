import 'package:flutter/material.dart';
import 'package:terrabia_mobile/core/constant/app_colors.dart';
import '../../farmer/pages/farmer_home_screen.dart';
import '../../buyer/pages/buyer_home_screen.dart';

class ProfileTypeScreen extends StatelessWidget {
  const ProfileTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choisir votre profil'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Comment souhaitez-vous utiliser TERRABIA ?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Sélectionnez le type de compte qui correspond à vos besoins',
              style: TextStyle(
                color: AppColors.textLight,
              ),
            ),
            const SizedBox(height: 30),
            
            // Carte Agriculteur
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.agriculture, size: 40, color: AppColors.primary),
                title: const Text(
                  'Agriculteur',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Vendez vos produits agricoles'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => FarmerHomeScreen()),
                  );
                },
              ),
            ),
            
            const SizedBox(height: 15),
            
            // Carte Acheteur
            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.shopping_cart, size: 40, color: Colors.blue),
                title: const Text(
                  'Acheteur',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Achetez des produits frais'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => BuyerHomeScreen()),
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