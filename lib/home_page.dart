import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('B E V E R A G E'),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
          
            TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.transparent,
                controller: _tabController,
                isScrollable: true,
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'Soda',
                  ),
                  Tab(
                    text: 'Chocolate',
                  ),
                  Tab(
                    text: 'Coffee',
                  )
                ]),
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
                            color: Colors.amberAccent,
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
            Text('data')
          ],
        ),
      ),
    );
  }
}
