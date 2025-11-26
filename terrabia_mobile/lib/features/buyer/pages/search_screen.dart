import 'package:flutter/material.dart';
import 'package:terrabia_mobile/core/constant/app_colors.dart';
import '../../../core/widgets/product_card.dart';
import 'product_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> _allProducts = [
    {
      'id': 1,
      'name': 'Tomates Fraîches',
      'price': '1500',
      'imageUrl': '',
      'farmer': 'Jean Agriculteur',
      'rating': 4.5,
      'category': 'Légumes',
    },
    {
      'id': 2,
      'name': 'Bananes Plantains',
      'price': '800',
      'imageUrl': '',
      'farmer': 'Marie Ferme',
      'rating': 4.2,
      'category': 'Fruits',
    },
    {
      'id': 3,
      'name': 'Piments',
      'price': '500',
      'imageUrl': '',
      'farmer': 'Pierre Jardin',
      'rating': 4.7,
      'category': 'Légumes',
    },
    {
      'id': 4,
      'name': 'Oignons',
      'price': '1200',
      'imageUrl': '',
      'farmer': 'Farmers Coop',
      'rating': 4.0,
      'category': 'Légumes',
    },
    {
      'id': 5,
      'name': 'Aubergines Africaines',
      'price': '700',
      'imageUrl': '',
      'farmer': 'Jean Agriculteur',
      'rating': 4.3,
      'category': 'Légumes',
    },
    {
      'id': 6,
      'name': 'Igname',
      'price': '2000',
      'imageUrl': '',
      'farmer': 'Marie Ferme',
      'rating': 4.6,
      'category': 'Tubercules',
    },
    {
      'id': 7,
      'name': 'Manioc',
      'price': '1500',
      'imageUrl': '',
      'farmer': 'Pierre Jardin',
      'rating': 4.4,
      'category': 'Tubercules',
    },
    {
      'id': 8,
      'name': 'Ananas',
      'price': '1000',
      'imageUrl': '',
      'farmer': 'Farmers Coop',
      'rating': 4.8,
      'category': 'Fruits',
    },
  ];

  List<Map<String, dynamic>> _filteredProducts = [];
  String _selectedCategory = 'Tous';

  @override
  void initState() {
    super.initState();
    _filteredProducts = _allProducts;
    _searchController.addListener(_filterProducts);
  }

  void _filterProducts() {
    final query = _searchController.text.toLowerCase();
    
    setState(() {
      _filteredProducts = _allProducts.where((product) {
        final matchesSearch = product['name'].toLowerCase().contains(query) ||
                            product['farmer'].toLowerCase().contains(query);
        final matchesCategory = _selectedCategory == 'Tous' || 
                               product['category'] == _selectedCategory;
        return matchesSearch && matchesCategory;
      }).toList();
    });
  }

  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
    _filterProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recherche'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Barre de recherche
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Rechercher un produit ou agriculteur...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
            ),
          ),

          // Filtres par catégorie
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildCategoryFilter('Tous'),
                _buildCategoryFilter('Légumes'),
                _buildCategoryFilter('Fruits'),
                _buildCategoryFilter('Tubercules'),
                _buildCategoryFilter('Épicerie'),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Résultats
          Expanded(
            child: _filteredProducts.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off, size: 60, color: Colors.grey),
                        SizedBox(height: 16),
                        Text(
                          'Aucun produit trouvé',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: _filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = _filteredProducts[index];
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
      ),
    );
  }

  Widget _buildCategoryFilter(String category) {
    final isSelected = _selectedCategory == category;
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(category),
        selected: isSelected,
        onSelected: (_) => _selectCategory(category),
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}