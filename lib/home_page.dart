import 'package:beverage/item_detail_page.dart';
import 'package:beverage/load_item_data.dart';
import 'package:flutter/material.dart';
import 'tab_bar_widget.dart';
import 'constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 5, vsync: this);

  final LoadItemData loadData = LoadItemData();
  //var sodaItems;

  @override
  void initState() {
    super.initState();
    //sodaItems = getSodaList();
    //print(sodaItems);
  }

  Future<Map<String, dynamic>> getSnackList() async {
    var result = await loadData.readJson();
    return result;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('B E V E R A G E S'),
      ),
      body: FutureBuilder(
        future: getSnackList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBarWidget(tabController: _tabController),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.36,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Snacks',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Expanded(
                            child: ListView.builder(
                                padding: const EdgeInsets.all(5),
                                itemCount: snapshot.data!['snackList'].length,
                                itemBuilder: ((context, index) {
                                  return GestureDetector(
                                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return  ItemDetailPage(snapshotData: snapshot, index: index, itemListName: 'snackList');
                                    })),
                                    child: Card(
                                      elevation: 2,
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image(
                                                image: AssetImage(snapshot
                                                    .data!['snackList'][index]['imgUrl']),
                                                height: 100,
                                                width: 100,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 50),
                                                child: Text(
                                                  snapshot.data!['snackList'][index]
                                                      ['itemName'],
                                                  style: kitemNameStyle,
                                                ),
                                              ),
                                              Text(
                                                '${snapshot.data!['snackList'][index]['price']}\$',
                                                style: kitemNameStyle,
                                              )
                                            ],
                                          )),
                                    ),
                                  );
                                })))
                      ]),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
