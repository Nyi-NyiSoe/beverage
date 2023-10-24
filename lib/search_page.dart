import 'package:flutter/material.dart';
import 'load_item_data.dart';
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoadItemData loadData = LoadItemData();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.shade300),
                  child: TextField(
                    onChanged: (value) {
                     
                      
                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        hintText: 'S e a r c h'),
                  ),
                ),
              ),
            ),

            ElevatedButton(onPressed: ()async{
              var data = await loadData.readJson();
              print(data[0]['itemName']);
            }, child: Text('load'))
          ],
        ),
      ),
    );
  }
}
