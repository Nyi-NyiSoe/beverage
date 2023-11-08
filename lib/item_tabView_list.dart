import 'package:beverage/item_detail_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ItemTabViewList extends StatelessWidget {
  final AsyncSnapshot<Map<String, dynamic>> snapshotData;
  final String itemListName;

  const ItemTabViewList(
      {super.key, required this.snapshotData, required this.itemListName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.405,
      //color: Colors.amberAccent,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshotData.data![itemListName].length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context){
                return ItemDetailPage(snapshotData: snapshotData,itemListName: itemListName,index: index,);
              })),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: const EdgeInsets.only(left: 5),
                      height: 180,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              image: AssetImage(snapshotData.data![itemListName]
                                  [index]['imgUrl']),
                              fit: BoxFit.contain)),
                    ),
                  ),
                  Card(
                    child: SizedBox(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${snapshotData.data![itemListName][index]['price'].toString()}\$',
                            style: kitemNameStyle,
                          ),
                          Text(
                            snapshotData.data![itemListName][index]['itemName'],
                            style: kitemNameStyle,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
