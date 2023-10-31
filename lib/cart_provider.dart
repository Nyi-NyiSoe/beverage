import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'item.dart';
class CartNotifier extends StateNotifier<List<Items>> {
  CartNotifier() : super([]);

  void addToCart(Items item) {
    state = [...state, item];
  }

  void removeFromCart(Items item) {
    state = List.from(state)..remove(item);
  }

  void clearCart() {
    state = [];
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<Items>>((ref) {
  return CartNotifier();
});
