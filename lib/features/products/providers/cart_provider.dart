import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/cart_item_model.dart';
import '../data/product_model.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addToCart(Product product) {
    final index = state.indexWhere((item) => item.product.id == product.id);

    if (index == -1) {
      state = [...state, CartItem(product: product, quantity: 1)];
    } else {
      final updatedList = [...state];
      final currentItem = updatedList[index];

      updatedList[index] = currentItem.copyWith(
        quantity: currentItem.quantity + 1,
      );

      state = updatedList;
    }
  }

  void increaseQuantity(Product product) {
    final updatedList = state.map((item) {
      if (item.product.id == product.id) {
        return item.copyWith(quantity: item.quantity + 1);
      }
      return item;
    }).toList();

    state = updatedList;
  }

  void decreaseQuantity(Product product) {
    final updatedList = <CartItem>[];

    for (final item in state) {
      if (item.product.id == product.id) {
        if (item.quantity > 1) {
          updatedList.add(item.copyWith(quantity: item.quantity - 1));
        }
      } else {
        updatedList.add(item);
      }
    }

    state = updatedList;
  }

  void removeFromCart(Product product) {
    state = state.where((item) => item.product.id != product.id).toList();
  }

  double get totalPrice {
    double total = 0;

    for (final item in state) {
      total += item.product.price * item.quantity;
    }

    return total;
  }
}
