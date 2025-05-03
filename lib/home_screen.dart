// 1️⃣ Home Page
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // About page e jao
                   context.push('/profile/121323/kjdsfvjbhdfgbjdf');
          },
          child: Text("Go to About Page"),
        ),
      ),
    );
  }
}