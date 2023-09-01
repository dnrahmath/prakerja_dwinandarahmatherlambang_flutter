// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//-----------
class _MyHomePageState extends State<MyHomePage> {
  int _indexNavBar = 0;
  final List<List<String>> _dataPhone = const [
    ["Leanne Gaham", "365463745-346734"],
    ["Dwi", "12323213-7868767"],
    ["Nanda", "54656-34554734"],
    ["Rahmat", "0898756675-37867734"],
    ["Herlambang", "6570-9-2134334"],
  ];

  void _updateIndex(int index) {
    setState(() {
      _indexNavBar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(CupertinoIcons.line_horizontal_3),
        backgroundColor: const Color.fromARGB(255, 150, 150, 150),
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 82, 82, 82),
      body: Container(
        color: Color.fromARGB(255, 228, 228, 228),
        child: Column(
          children: <Widget>[
            for (int index = 0; index < _dataPhone.length; index++)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: Text(
                          _dataPhone[index][0][0],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _dataPhone[index][0],
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          _dataPhone[index][1],
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(255, 119, 119, 119),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 82, 82, 82),
        currentIndex: _indexNavBar,
        onTap: (index) {
          _updateIndex(index);
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey, //button color
        selectedItemColor: Colors.greenAccent, //select button color
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w300),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
