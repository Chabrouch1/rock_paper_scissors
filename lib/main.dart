import 'package:flutter/material.dart';
import 'package:rock/rootPage.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Rock Paper Scissors",
      home: RootPage(),

    );
  }
}