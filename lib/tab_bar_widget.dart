import 'package:beverage/constants.dart';
import 'package:flutter/material.dart';
import 'item_tabView_list.dart';
import 'load_item_data.dart';

class TabBarWidget extends StatelessWidget {
  TabBarWidget({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;
  final LoadItemData loadData = LoadItemData();

  Future<Map<String, dynamic>> getItems() async {
    var result = await loadData.readJson();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Center(
            child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.red,
                controller: _tabController,
                isScrollable: true,
                labelColor: Colors.black,
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                unselectedLabelStyle: const TextStyle(color: Colors.grey),
                tabs: const [
                  Tab(
                    text: 'Soda',
                  ),
                  Tab(
                    text: 'Juice',
                  ),
                  Tab(
                    text: 'Tea',
                  ),
                  Tab(
                    text: 'Coffee',
                  ),
                  Tab(
                    text: 'Alcohol',
                  )
                ]),
          ),
          Expanded(
            child: TabBarView(
                viewportFraction: 1,
                controller: _tabController,
                children: [
                  FutureBuilder(
                      future: getItems(),
                      builder: ((context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else {
                          return itemTabViewList(snapshotData: snapshot,itemListName: 'sodaList',);
                        }
                      })),
                  FutureBuilder(
                      future: getItems(),
                      builder: ((context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else {
                          return itemTabViewList(snapshotData: snapshot,itemListName: 'juiceList',);
                        }
                      })),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.405,
                    color: Colors.blue,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.405,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.405,
                    color: Colors.green,
                  )
                ]),
          ),
        ],
      ),
    );
  }
}


