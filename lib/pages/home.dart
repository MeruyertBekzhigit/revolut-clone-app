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
      body: Container(
          margin:
              const EdgeInsets.only(left: 16, top: 24, right: 16, bottom: 24),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.add_a_photo, color: Colors.black, size: 30),
                  Expanded(
                    child: Container(),
                  ),
                  const Icon(Icons.bar_chart_rounded,
                      color: Colors.black, size: 30),
                  const SizedBox(width: 40),
                  const Icon(Icons.star_rate_rounded,
                      color: Colors.black, size: 30),
                  const SizedBox(width: 40),
                  const Icon(Icons.notifications,
                      color: Colors.black, size: 30),
                ],
              ),
              Row(
                children: [],
              ),
              Row(),
            ],
          )),
    );
  }
}
