import 'package:beverage/constants.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

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
                  Container(
                    height: MediaQuery.of(context).size.height * 0.405,
                    //color: Colors.amberAccent,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
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
                                              'images/soda/coca_cola.jpg'))),
                                ),
                              ),
                             Container(
                              width: 150,
                               child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('20',style: kitemNameStyle,),
                                  Text('Cocacola',style: kitemNameStyle,)
                                ],
                               ),
                             )
                            ],
                          );
                        }),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.405,
                    color: Colors.red,
                  ),
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
