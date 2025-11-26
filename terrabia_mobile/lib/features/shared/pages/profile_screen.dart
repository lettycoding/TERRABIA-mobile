import 'package:flutter/material.dart';
import 'package:terrabia_mobile/core/constant/app_colors.dart';
import '../../../core/widgets/primary_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Déconnexion'),
        content: const Text('Êtes-vous sûr de vouloir vous déconnecter ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            },
            child: const Text(
              'Déconnexion',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Profil'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // En-tête profil
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: AppColors.primary,
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'john.doe@email.com',
                      style: TextStyle(
                        color: AppColors.textLight,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Chip(
                      label: const Text('Acheteur'),
                      backgroundColor: AppColors.primary.withOpacity(0.1),
                      labelStyle: const TextStyle(color: AppColors.primary),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Menu options
            Card(
              child: Column(
                children: [
                  _buildMenuOption(
                    icon: Icons.edit,
                    title: 'Modifier le profil',
                    onTap: () {
                      // TODO: Implémenter modification profil
                    },
                  ),
                  _buildMenuOption(
                    icon: Icons.shopping_bag,
                    title: 'Mes commandes',
                    onTap: () {
                      // TODO: Implémenter historique commandes
                    },
                  ),
                  _buildMenuOption(
                    icon: Icons.favorite,
                    title: 'Mes favoris',
                    onTap: () {
                      // TODO: Implémenter favoris
                    },
                  ),
                  _buildMenuOption(
                    icon: Icons.location_on,
                    title: 'Adresses de livraison',
                    onTap: () {
                      // TODO: Implémenter gestion adresses
                    },
                  ),
                  _buildMenuOption(
                    icon: Icons.notifications,
                    title: 'Notifications',
                    onTap: () {
                      // TODO: Implémenter paramètres notifications
                    },
                  ),
                  _buildMenuOption(
                    icon: Icons.security,
                    title: 'Sécurité',
                    onTap: () {
                      // TODO: Implémenter sécurité
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Bouton déconnexion
            PrimaryButton(
              text: 'Déconnexion',
              onPressed: () => _logout(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}