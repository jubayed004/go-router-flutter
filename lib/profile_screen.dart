import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  final String phoneNumber;
  final String id;
  const ProfileScreen({super.key, required this.phoneNumber, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My profile screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
            context.push('/about?category=I-Phone&price=30333tk&isClicked=true&subcribtion=33.99');
              },
              child: Text("Try to Go Back: "),
            ),
            SizedBox(height: 100,),
            Center(child: Text("🔍 Searching for: $phoneNumber--------$id")),
          ],
        ),
      ),
    );
  }
}
