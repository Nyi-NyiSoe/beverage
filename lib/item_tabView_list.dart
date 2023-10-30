import 'package:flutter/material.dart';
import 'constants.dart';
class itemTabViewList extends StatelessWidget {
  AsyncSnapshot<Map<String, dynamic>> snapshotData;
  String itemListName;

  itemTabViewList({super.key, required this.snapshotData,required this.itemListName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.405,
      //color: Colors.amberAccent,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshotData.data![itemListName].length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.only(left: 5),
                    height: 180,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage(
                                snapshotData.data![itemListName][index]['imgUrl']),
                            fit: BoxFit.cover)),
                  ),
                ),
               
                Container(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        snapshotData.data![itemListName][index]['price'],
                        style: kitemNameStyle,
                      ),
                      Text(
                        snapshotData.data![itemListName][index]['itemName'],
                        style: kitemNameStyle,
                      )
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}