import 'dart:ffi';

import 'package:beverage/cart_provider.dart';
import 'package:beverage/constants.dart';
import 'package:beverage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'location_service.dart';

class InvoiceScreen extends StatelessWidget {
  InvoiceScreen({super.key});

  final List<String> tableTitles = [
    'Description',
    'Quantity',
    'Unit Price',
    'Total'
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, WidgetRef ref, __) {
      final getLocation = ref.watch(locationProvider);
      final cartItems = ref.watch(cartProvider);
      final calculateTotal = ref.watch(cartProvider.notifier);

      return SafeArea(
          child: Scaffold(
        appBar: AppBar(title: const Text('I N V O I C E')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.brown.shade900,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat('dd/MM/yy').format(DateTime.now()),
                            style: kitemNameStyle.copyWith(color: Colors.white),
                          ),
                          const Icon(
                            Icons.receipt_long,
                            size: 100,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Delivery Address',
                          style: kitemNameStyle.copyWith(color: Colors.white),
                        ),
                        Text(
                          getLocation.currentPosition == null
                              ? 'Click to get location'
                              : '${getLocation.currentPosition!.latitude} ${getLocation.currentPosition!.longitude}',
                          style: kitemNameStyle.copyWith(color: Colors.white),
                        ),
                        TextButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                iconSize: MaterialStatePropertyAll(30)),
                            onPressed: () {
                              getLocation.getCurrentLocation();
                            },
                            child: const Icon(Icons.location_on))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Items',
                        style: kitemNameStyle.copyWith(color: Colors.black),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          DataTable(
                              headingRowColor: MaterialStatePropertyAll(
                                  Colors.grey.shade400),
                              columnSpacing: 30,
                              columns: tableTitles
                                  .map((e) => DataColumn(label: Text(e)))
                                  .toList(),
                              rows: cartItems.entries.map(
                                (e) {
                                  final item = e.key;
                                  final quantity = e.value;
                                  return DataRow(cells: [
                                    DataCell(Text(item.itemName)),
                                    DataCell(Text(quantity.toString())),
                                    DataCell(Text(item.price)),
                                    DataCell(Text(
                                        (double.parse(item.price) * quantity)
                                            .toString())),
                                  ]);
                                },
                              ).toList()),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 3,
                      color: Colors.black,
                    ),
                    ListTile(
                      leading: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                      title: const Text('Total amount due'),
                      trailing:
                          Text(calculateTotal.totalItemPrice().toString()),
                    ),
                    const Divider(
                      thickness: 3,
                      color: Colors.black,
                    ),
                    Center(
                        child: ElevatedButton(
                            onPressed: () async {
                              showDialog(
                                  context: context,
                                  builder: ((context) {
                                    return AlertDialog(
                                      content: const Text(
                                          'Your order has been placed successfully!'),
                                      actions: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.popUntil(context,
                                                  (route) => route.isFirst);
                                                  calculateTotal.clearCart();
                                            },
                                            icon: const Icon(Icons.check))
                                      ],
                                    );
                                  }));
                            },
                            child: const Text('Confirm')))
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
    });
  }
}
