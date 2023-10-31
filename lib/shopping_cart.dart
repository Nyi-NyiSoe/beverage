import 'package:beverage/constants.dart';
import 'package:flutter/material.dart';
import 'cart_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'item.dart';

class ShoppingCartPage extends ConsumerWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Items> cartItems = ref.watch(cartProvider);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: cartItems.length,
                padding: EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  return Container(
                    height: 150,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(image: AssetImage(cartItems[index].imgUrl)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                cartItems[index].itemName,
                                style: kitemNameStyle,
                              ),
                              Text(
                                '${cartItems[index].price}\$',
                                style: kitemNameStyle,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.add),
                                Text('count'),
                                Icon(Icons.remove)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    ));
  }
}
