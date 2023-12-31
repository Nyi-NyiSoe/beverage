import 'package:beverage/cart_provider.dart';
import 'package:beverage/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home_page.dart';
import 'package:badges/badges.dart' as badges;

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final List<Widget> pageList = [
    const HomePage(),
    const ShoppingCartPage(),
  ];

  final _pageProvider = StateProvider((ref) => 0);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(_pageProvider);
     final CartProvider cartBadge = ref.watch(cartProvider.notifier);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown.shade900),
      ),
      home: Scaffold(
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.brown.shade900),
              child: SizedBox(
                height: 36,
                width: 36,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        ref.read(_pageProvider.notifier).state = 0;
                      },
                      child: Icon(
                        pageIndex == 0 ? Icons.home : Icons.home_outlined,
                        color: Colors.white,
                      ),
                    ),
                   
                    GestureDetector(
                        onTap: () {
                          ref.read(_pageProvider.notifier).state = 1;
                        },
                        child: badges.Badge(
                          badgeContent: Text(cartBadge.totalItemCount().toString()),
                          child: Icon(
                            pageIndex == 2
                                ? Icons.shopping_cart
                                : Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                        )
                        ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: pageList[pageIndex],
      ),
    );
  }
}
