
// 2️⃣ About Page
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutPage extends StatelessWidget {
  final String category;
  final String price;
  final bool isClicked;
  final double pi;
  const AboutPage({super.key, required this.category, required this.price, required this.isClicked, required this.pi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
             context.push('/fruitListScreen',extra: true);
            },
                child: Text("Go To Profile Page")),
            SizedBox(height: 300,),
            Column(
              children: [
                Center(child: Text("This mobile name is : $category")),
                Center(child: Text("Mobile Price is : $price")),
                Center(child: Text("Price is less Then Android Phn  : $isClicked")),
                Center(child: Text("Price is  : $pi")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}