import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Wisdom extends StatefulWidget {
  const Wisdom({Key? key}) : super(key: key);

  @override
  State<Wisdom> createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = [
    "The greatest glory in living lies not in never falling, but in rising every time we fall.",
    "The way to get started is to quit talking and begin doing.",
    "Your time is limited, so don't waste it living someone else's life.",
    "If life were predictable it would cease to be life, and be without flavor."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          //alignment: Alignment.center,
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
                width: 350,
                height: 200,
                margin: const EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.5)),
                child: Center(
                    child: Text(
                  quotes[_index % quotes.length],
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 20,
                      fontStyle: FontStyle.italic),
                ))),
          ),
          const Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: FlatButton.icon(
                onPressed: _showQuote,
                color: Colors.greenAccent.shade400,
                icon: const Icon(Icons.wb_sunny),
                label: const Text("Inspire me!",
                    style:
                        const TextStyle(fontSize: 18.8, color: Colors.white))),
          ),
          Spacer()
        ],
      )),
    );
  }

  void _showQuote() {
    //increment our _index/counter by 1
    setState(() {
      _index += 1;
    });
  }
}

class BizCard extends StatelessWidget {
  const BizCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BizCard"),
          centerTitle: true,
        ),
        backgroundColor: Colors.redAccent,
        body: Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[_getAvatar(), _getCard()],
          ),
        ));
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: const EdgeInsets.all(60.0),
      decoration: BoxDecoration(
          color: Colors.pinkAccent, borderRadius: BorderRadius.circular(14)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Lokesh",
            style: TextStyle(
                fontSize: 20.9,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          const Text("BuildApp"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(Icons.person_outline),
              Text("T: @buildAppWithMe")
            ],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.redAccent, width: 1.2),
          image: const DecorationImage(
              image: const NetworkImage("https://picsum.photos/200/300"),
              fit: BoxFit.cover)),
    );
  }
}

class ScaffoldExample extends StatelessWidget {
  const ScaffoldExample({Key? key}) : super(key: key);

  _tapButton() {
    debugPrint("Tapped button");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scaffold"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade700,
        actions: <Widget>[
          IconButton(
              onPressed: () => debugPrint("Email tapped!"),
              icon: const Icon(Icons.email)),
          IconButton(
              onPressed: _tapButton, icon: const Icon(Icons.access_alarms))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen,
          child: const Icon(Icons.call_missed),
          onPressed: () => debugPrint("Hello FloatingActionButton")),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "First",
            backgroundColor: Colors.amber),
        BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit), label: "second", tooltip: "Lokesh"),
        BottomNavigationBarItem(icon: Icon(Icons.access_alarm), label: "Third"),
      ], onTap: (int index) => debugPrint("Tapped item : $index")),
      backgroundColor: Colors.lightBlue,
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              CustomButton()
              //Text("data")
              // InkWell(
              //   child: const Text(
              //     "Tap me!",
              //     style: TextStyle(fontSize: 23.4),
              //   ),
              //   onTap: () => debugPrint("tapped...."),
              // )
            ],
          )),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: const Text("Hello snackbar!"),
          backgroundColor: Colors.amberAccent.shade700,
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.pinkAccent, borderRadius: BorderRadius.circular(8.0)),
        child: const Text("Button"),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.lightBlue,
      child: Center(
        child: Text(
          "Hello Flutter",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 23.4,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
    // return const Center(
    //     child: Text(
    //   "Hello Flutter!",
    //   textDirection: TextDirection.ltr,
    // ));
  }
}
