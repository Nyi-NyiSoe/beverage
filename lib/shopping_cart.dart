import 'package:beverage/constants.dart';
import 'package:flutter/material.dart';
import 'cart_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'item.dart';

class ShoppingCartPage extends ConsumerWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<Items, int> cartItems = ref.watch(cartProvider);
    final CartProvider cartCount = ref.read(cartProvider.notifier);

    return cartItems.isEmpty
        ? SafeArea(
            child: Scaffold(
            appBar: AppBar(
              title: const Text('Your Cart'),
              actions: [
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: ((context) {
                            return AlertDialog(
                              content:
                                  const Text('Your cart is already empty!'),
                              actions: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.check))
                              ],
                            );
                          }));
                    },
                    icon: Icon(Icons.delete))
              ],
            ),
            body: const Center(
              child: Text('Your Cart is Empty!'),
            ),
          ))
        : SafeArea(
            child: Scaffold(
            appBar: AppBar(
              title: const Text('Your Cart'),
              actions: [
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: ((context) {
                            return AlertDialog(
                              content: const Text(
                                  'Are you sure you want to empty your cart?'),
                              actions: [
                                IconButton(
                                    onPressed: () {
                                      cartCount.clearCart();
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.check))
                              ],
                            );
                          }));
                    },
                    icon: Icon(Icons.delete))
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: cartItems.length,
                      padding: const EdgeInsets.all(10),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 150,
                          child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image(
                                    image: AssetImage(cartItems.keys
                                        .elementAt(index)
                                        .imgUrl)),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      cartItems.keys.elementAt(index).itemName,
                                      style: kitemNameStyle,
                                    ),
                                    Text(
                                      '${cartItems.keys.elementAt(index).price}\$',
                                      style: kitemNameStyle,
                                    ),
                                    Text(
                                        'Total: \$ ${int.parse(cartItems.keys.elementAt(index).price) * cartItems.values.elementAt(index)}')
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                          onTap: () => cartCount
                                              .incrementItemCount(cartItems.keys
                                                  .elementAt(index)),
                                          child: const Icon(Icons.add)),
                                      Text(cartItems.values
                                          .elementAt(index)
                                          .toString()),
                                      GestureDetector(
                                          onTap: () => cartCount
                                              .decrementItemCount(cartItems.keys
                                                  .elementAt(index)),
                                          child: const Icon(Icons.remove))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                ElevatedButton(onPressed: () {}, child: Text('Place Order'))
              ],
            ),
          ));
  }
}
