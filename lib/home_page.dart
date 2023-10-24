import 'package:flutter/material.dart';
import 'item.dart';
import 'tab_bar_widget.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBarWidget(tabController: _tabController),
          Container(
            height: MediaQuery.of(context).size.height * 0.36,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('All beverages'),
                  Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.all(5),
                        
                          itemCount: 5,
                          itemBuilder: ((context, index) {
                            return Card(
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  leading: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.redAccent),
                                    child: Image(
                                      image: AssetImage('images/cola.png'),
                                    ),
                                  ),
                                  title: Text('Cocacola',style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.w500),),
                                  trailing: Text('20',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                                ),
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
