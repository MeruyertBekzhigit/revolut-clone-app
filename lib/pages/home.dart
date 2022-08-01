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
      backgroundColor: const Color(0xfff7f7f7),
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
              buildQuickAccessMenuBar(),
              const SizedBox(height: 16),
              buildInputSearchBar(context),
              const SizedBox(height: 16),
              buildAvailableProductSegments(context)
            ],
          )),
    );
  }

  Widget buildQuickAccessMenuBar() {
    return Row(
      children: [
        const IconButton(
          icon: Icon(Icons.add_a_photo, color: Colors.black, size: 35),
          onPressed: null,
        ),
        Expanded(
          child: Container(),
        ),
        const IconButton(
          icon: Icon(Icons.bar_chart_rounded, color: Colors.black, size: 35),
          onPressed: null,
        ),
        const SizedBox(width: 15),
        const IconButton(
          icon: Icon(Icons.star_rate_rounded, color: Colors.black, size: 35),
          onPressed: null,
        ),
        const SizedBox(width: 15),
        const IconButton(
          icon: Icon(Icons.notifications, color: Colors.black, size: 35),
          onPressed: null,
        ),
      ],
    );
  }

  Widget buildInputSearchBar(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: TextField(
            style: TextStyle(color: Colors.black, fontSize: 16),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Color(0xffeceef2),
                hintText: 'Search',
                prefixIcon: Icon(
                  Icons.search,
                  size: 24,
                ),
                isDense: true),
          ),
        ),
      ],
    );
  }

  Widget buildAvailableProductSegments(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CupertinoSlidingSegmentedControl<AvailableProductSegments>(
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
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              AvailableProductSegments.cards: Text(
                'Cards',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              AvailableProductSegments.stocks: Text(
                'Stocks',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              AvailableProductSegments.crypto: Text(
                'Crypto',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              AvailableProductSegments.vaults: Text(
                'Vaults',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            },
          ),
        ),
      ],
    );
  }
}
