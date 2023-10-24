import 'package:beverage/search_page.dart';
import 'package:beverage/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_page.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  List<Widget> pageList = [
    const HomePage(),
    const SearchPage(),
    const ShoppingCartPage(),
  ];

  final _pageProvider = StateProvider((ref) => 0);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(_pageProvider);
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
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(horizontal: 10),
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
                        child: Icon(
                          pageIndex == 1 ? Icons.search : Icons.search_outlined,
                          color: Colors.white,
                        )),
                    GestureDetector(
                        onTap: () {
                          ref.read(_pageProvider.notifier).state = 2;
                        },
                        child: Icon(
                          pageIndex == 2
                              ? Icons.shopping_cart
                              : Icons.shopping_cart_outlined,
                          color: Colors.white,
                        )),
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
