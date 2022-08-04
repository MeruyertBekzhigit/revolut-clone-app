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
      body: SingleChildScrollView(
        child: Container(
            margin:
                const EdgeInsets.only(left: 24, top: 24, right: 24, bottom: 24),
            child: Column(
              children: [
                buildQuickAccessMenuBar(),
                const SizedBox(height: 16),
                buildInputSearchBar(context),
                const SizedBox(height: 16),
                buildAvailableProductSegments(context),
                const SizedBox(height: 16),
                chooseCardToDisplay(),
                const SizedBox(height: 20),
                buildSectionHeader('Recent'),
                buildRecentPaymentsSection(),
              ],
            )),
      ),
    );
  }

  Widget chooseCardToDisplay() {
    if (_selectedSegment == AvailableProductSegments.accounts) {
      return buildAccountInfoPanel();
    } else {
      return Container();
    }
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
            padding: EdgeInsets.all(2),
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
              // extract to build segments with text parameter
              AvailableProductSegments.accounts: Text(
                'Accounts',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              AvailableProductSegments.cards: Text(
                'Cards',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              AvailableProductSegments.stocks: Text(
                'Stocks',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              AvailableProductSegments.crypto: Text(
                'Crypto',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              AvailableProductSegments.vaults: Text(
                'Vaults',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            },
          ),
        ),
      ],
    );
  }

  Widget buildBalanceInfo() {
    return Row(children: [
      InkWell(
        onTap: () {},
        child: Row(
          children: const [
            Text(
              '0 €',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(Icons.expand_circle_down_rounded, color: Colors.blue),
            )
          ],
        ),
      ),
      Expanded(
        child: Container(),
      ),
      const Icon(
        Icons.panorama_fish_eye_outlined,
        color: Colors.blue,
        size: 35,
      ),
    ]);
  }

  Widget buildAccountActionsPanel() {
    return Row(
      children: [
        Ink(
          width: 140,
          height: 40,
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xffe5f0fc)),
          child: InkWell(
            onTap: () {},
            splashColor: Colors.white70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.add, color: Colors.blue, size: 18),
                Text(
                  'Add money',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Ink(
          width: 120,
          height: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color(0xffe5f0fc),
          ),
          child: InkWell(
            onTap: () {},
            splashColor: Colors.white70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.compare_arrows_rounded,
                    color: Colors.blue, size: 18),
                Text(
                  'Transfer',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Ink(
          width: 50,
          height: 40,
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xffe5f0fc)),
          child: InkWell(
            onTap: () {},
            splashColor: Colors.white70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.more_horiz_rounded, color: Colors.blue, size: 18),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSectionHeader(String headerTitle) {
    return Row(
      children: [
        Text(
          headerTitle,
          style: TextStyle(fontSize: 16, color: Color(0xff75808a)),
        ),
        Expanded(
          child: Container(),
        ),
        const TextButton(
          onPressed: null,
          child: Text(
            'See all',
            style: TextStyle(fontSize: 16, color: Colors.blue),
          ),
        )
      ],
    );
  }

  Widget buildTransactionsSectionBody() {
    return Row(
      children: [
        const IconButton(
          icon: Icon(Icons.autorenew, color: Colors.black, size: 35),
          onPressed: null,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Sold EUR for USD',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 6),
              Text('11 July, 19:08',
                  style: TextStyle(
                    color: Color(0xff75808a),
                    fontSize: 15,
                  ))
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text(
              '- 3.41 €',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 6),
            Text('+ 3.43 \$',
                style: TextStyle(
                  color: Color(0xff75808a),
                  fontSize: 15,
                ))
          ],
        )
      ],
    );
  }

  Widget buildAccountInfoPanel() {
    return Center(
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildBalanceInfo(),
              const SizedBox(
                height: 8,
              ),
              buildAccountActionsPanel(),
              const SizedBox(
                height: 20,
              ),
              buildSectionHeader('Transactions'),
              buildTransactionsSectionBody(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildRecentPaymentsSection() {
  return Container(
    height: 130,
    child: Card(
      color: Colors.white,
      child: ListView(
        padding: const EdgeInsets.only(left: 8, top: 16, right: 8),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          ContactList('Jane Doe'),
          ContactList('Jane Doe'),
          ContactList('Jane Doe'),
          ContactList('Jane Doe'),
          ContactList('Jane Doe'),
          ContactList('Jane Doe'),
          ContactList('Jane Doe'),
          ContactList('Jane Doe'),
          ContactList('Jane Doe'),
          ContactList('Jane Doe'),
          ContactList('Jane Doe'),
        ],
      ),
    ),
  );
}

Widget ContactList(String name) {
  return Row(
    children: [
      Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: const [
              Image(
                image: NetworkImage('https://httpbin.org/image'),
                width: 50,
                height: 50,
              ),
              Positioned(
                bottom: -3,
                right: -4,
                child: CircleAvatar(
                  radius: 9,
                  backgroundImage: AssetImage('assets/images/revolut_icon.png'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
      const SizedBox(
        width: 20,
      )
    ],
  );
}
