import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AvailableProductSegments { accounts, cards, stocks, crypto, vaults }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  AvailableProductSegments _selectedSegment = AvailableProductSegments.accounts;

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
              Row(),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CupertinoSlidingSegmentedControl<
                        AvailableProductSegments>(
                      backgroundColor: Colors.transparent,
                      groupValue: _selectedSegment,
                      onValueChanged: (AvailableProductSegments? value) {
                        if (value != null) {
                          setState(() {
                            _selectedSegment = value;
                          });
                        }
                      },
                      children: const <AvailableProductSegments, Widget>{
                        AvailableProductSegments.accounts: Text(
                          'Accounts',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        AvailableProductSegments.cards: Text(
                          'Cards',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        AvailableProductSegments.stocks: Text(
                          'Stocks',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        AvailableProductSegments.crypto: Text(
                          'Crypto',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        AvailableProductSegments.vaults: Text(
                          'Vaults',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      },
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
