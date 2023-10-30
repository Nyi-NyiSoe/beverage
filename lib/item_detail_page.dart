import 'package:beverage/constants.dart';
import 'package:flutter/material.dart';

class ItemDetailPage extends StatelessWidget {
  final AsyncSnapshot<Map<String, dynamic>> snapshotData;
  final int index;
  final String itemListName;
  ItemDetailPage(
      {super.key,
      required this.snapshotData,
      required this.index,
      required this.itemListName});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.brown.shade900,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_shopping_cart),
      ),
      appBar: AppBar(
        title: const Text('Item Detail'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshotData.data![itemListName][index]['itemName'],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        snapshotData.data![itemListName][index]['price'] + '\$',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 70,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Particulars',
                      style: kitemNameStyle,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      snapshotData.data![itemListName][index]['particulars'],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Positioned(
              left: 200,
              top: 30,
              child: Image(
                image: AssetImage(
                    snapshotData.data![itemListName][index]['imgUrl']),
                height: 300,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
