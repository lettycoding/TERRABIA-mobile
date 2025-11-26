import 'package:flutter/material.dart';
import 'package:terrabia_mobile/core/constant/app_colors.dart';
import '../../../core/widgets/bottom_nav_bar.dart';
import '../../../core/widgets/product_card.dart';
import 'product_detail_screen.dart';
import 'cart_screen.dart';
import 'search_screen.dart';
import '../../shared/pages/profile_screen.dart';

class BuyerHomeScreen extends StatefulWidget {
  const BuyerHomeScreen({super.key});

  @override
  State<BuyerHomeScreen> createState() => _BuyerHomeScreenState();
}

class _BuyerHomeScreenState extends State<BuyerHomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const _HomeContent(),
    const SearchScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 0
          ? AppBar(
              title: const Text('TERRABIA - Marché'),
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
            )
          : null,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

// Contenu de la page d'accueil
class _HomeContent extends StatefulWidget {
  const _HomeContent();

  @override
  State<_HomeContent> createState() => __HomeContentState();
}

class __HomeContentState extends State<_HomeContent> {
  final List<Map<String, dynamic>> _products = [
    {
      'id': 1,
      'name': 'Tomates Fraîches',
      'price': '1500',
      'imageUrl': '',
      'farmer': 'Jean Agriculteur',
      'rating': 4.5,
    },
    {
      'id': 2,
      'name': 'Bananes Plantains',
      'price': '800',
      'imageUrl': '',
      'farmer': 'Marie Ferme',
      'rating': 4.2,
    },
    {
      'id': 3,
      'name': 'Piments',
      'price': '500',
      'imageUrl': '',
      'farmer': 'Pierre Jardin',
      'rating': 4.7,
    },
    {
      'id': 4,
      'name': 'Oignons',
      'price': '1200',
      'imageUrl': '',
      'farmer': 'Farmers Coop',
      'rating': 4.0,
    },
    {
      'id': 5,
      'name': 'Aubergines Africaines',
      'price': '700',
      'imageUrl': '',
      'farmer': 'Jean Agriculteur',
      'rating': 4.3,
    },
    {
      'id': 6,
      'name': 'Igname',
      'price': '2000',
      'imageUrl': '',
      'farmer': 'Marie Ferme',
      'rating': 4.6,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // En-tête avec bannière
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          color: AppColors.primary.withOpacity(0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Produits Frais du Cameroun',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Découvrez les meilleurs produits agricoles locaux',
                style: TextStyle(
                  color: AppColors.textLight,
                ),
              ),
            ],
          ),
        ),

        // Catégories
        SizedBox(
          height: 60,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            children: [
              _buildCategoryChip('Tous', true),
              _buildCategoryChip('Légumes', false),
              _buildCategoryChip('Fruits', false),
              _buildCategoryChip('Tubercules', false),
              _buildCategoryChip('Épicerie', false),
            ],
          ),
        ),

        // Liste des produits
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                return ProductCard(
                  name: product['name'],
                  price: product['price'],
                  imageUrl: product['imageUrl'],
                  farmerName: product['farmer'],
                  rating: product['rating'],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(product: product),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryChip(String text, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(text),
        selected: isSelected,
        onSelected: (bool value) {
          // TODO: Filtrer les produits
        },
        backgroundColor: Colors.white,
        selectedColor: AppColors.primary,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : AppColors.textDark,
        ),
        shape: StadiumBorder(
          side: BorderSide(
            color: isSelected ? AppColors.primary : Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}