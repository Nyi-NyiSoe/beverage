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
            indicatorColor: Colors.transparent,
            controller: _tabController,
            isScrollable: true,
            labelColor: Colors.black,
            tabs:  [
             Tab(
              text: 'Coffee',
             ),
               Tab(
              text: 'Alcohol',
             ),
               Tab(
              text: 'Cocktail',
             )
            ]),
      ),
      Expanded(
        child: Column(
          children: [
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
                        itemBuilder: (context,index){
                        return Card(
                          child: Container(
                            child: Column(
                              children: [
                                Image(image: AssetImage('images/cola.png'),height: 200,),
                                Text('cocacola')
                              ],
                            ),
                          ),
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
                    )
                  ]),
            )
          ],
        ),
      ),
        ],
      ),
    );
  }
}
