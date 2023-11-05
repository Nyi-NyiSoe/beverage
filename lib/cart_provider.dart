import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'item.dart';

class CartProvider extends StateNotifier<Map<Items, int>> {
  final _itemCountController = StreamController<int>.broadcast();
  CartProvider() : super({});

  Stream<int> get itemCountStream => _itemCountController.stream;

  void addToCart(Items item) {
    state = Map<Items, int>.from(state);
    if (state.containsKey(item)) {
      state[item] = state[item]! + 1;
    } else {
      state[item] = 1;
    }
  }

  void incrementItemCount(Items item) {
    state = Map<Items, int>.from(state);
    if (state.containsKey(item)) {
      state[item] = state[item]! + 1;
    }
  }

  void decrementItemCount(Items item) {
    state = Map<Items, int>.from(state);
    if (state[item]! > 1) {
      state[item] = state[item]! - 1;
    } else {
      state.remove(item);
    }
  }

  int totalItemCount() {
    return state.values.fold(0, (sum, value) => sum + value);
  }

  void clearCart() {
    state = {};
  }
}

final cartProvider =
    StateNotifierProvider<CartProvider, Map<Items, int>>((ref) {
  return CartProvider();
});
