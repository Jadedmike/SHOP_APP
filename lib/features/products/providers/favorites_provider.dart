import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, Set<int>>((
  ref,
) {
  return FavoritesNotifier();
});

class FavoritesNotifier extends StateNotifier<Set<int>> {
  FavoritesNotifier() : super({});

  void toggleFavorite(int productId) {
    if (state.contains(productId)) {
      final update = Set<int>.from(state);
      update.remove(productId);
      state = update;
    } else {
      state = {...state, productId};
    }
  }
}
