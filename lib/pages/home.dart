import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffe5e8e8),
        appBar: AppBar(
          title: const Text('Revolut', style: TextStyle(color: Colors.black)),
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
        ),
        body: Container());
  }
}
