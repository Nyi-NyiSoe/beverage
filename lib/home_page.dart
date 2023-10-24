import 'package:beverage/load_item_data.dart';
import 'package:flutter/material.dart';
import 'item.dart';
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
  var sodaItems = [];

  @override
  void initState() {
    super.initState();
    getSodaList();
    print(sodaItems);
  }

  void getSodaList() async {
    sodaItems = await loadData.readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('B E V E R A G E S'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBarWidget(tabController: _tabController),
          Container(
            height: MediaQuery.of(context).size.height * 0.36,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('All beverages'),
              Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.all(5),
                      itemCount: sodaItems.length,
                      itemBuilder: ((context, index) {
                        return Card(
                          
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image(image: AssetImage(sodaItems[index]['imgUrl']),height: 100,width: 100,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 50),
                                  child: Text(sodaItems[index]['itemName'],style: kitemNameStyle,),
                                ),
                                Text(sodaItems[index]['price'],style: kitemNameStyle,)
                              ],
                            )
                          ),
                        );
                      })))
            ]),
          )
        ],
      ),
    );
  }
}
