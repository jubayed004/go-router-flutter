import 'package:flutter/material.dart';

class FruitListScreen extends StatelessWidget {
  final bool? data;
   FruitListScreen({super.key,  required this.data});

  final List<String> fruits = ["Apple", "Banana", "Mango"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fruit List")),
      body: Column(
        children: [
          Text("$data",style: data != null && data! ?TextStyle(fontSize: 30,fontWeight: FontWeight.w500):null
    ),
          Flexible(
            child: ListView(
              children: fruits.map((item) {
                return ListTile(
                    title: Text("🍎 $item"));
              }).toList(),
            ),
          ),
          Text("$data",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }
}