import 'package:flutter/material.dart';
import 'package:go_router_app/route/go_router.dart';

void main() {
  runApp(MyApp());
}

// 4️⃣ Main App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'GoRouter App',
      debugShowCheckedModeBanner: false,
    );
  }
}
