import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/products_provider.dart';
import '../providers/favorites_provider.dart';
import 'widgets/product_card.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    final productsAsync = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites'), centerTitle: true),
      body: productsAsync.when(
        data: (products) {
          final favoriteProducts = products
              .where((product) => favorites.contains(product.id))
              .toList();

          if (favoriteProducts.isEmpty) {
            return const Center(
              child: Text(
                'No favorites yet!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.7,
            ),
            itemCount: favoriteProducts.length,
            itemBuilder: (context, index) {
              final product = favoriteProducts[index];
              return ProductCard(product: product);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) =>
            const Center(child: Text('Failed to load products')),
      ),
    );
  }
}
