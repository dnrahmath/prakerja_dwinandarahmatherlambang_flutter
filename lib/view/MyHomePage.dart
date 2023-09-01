// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:prakerja_dwinandarahmatherlambang/view/hlmn3Page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//-----------
class _MyHomePageState extends State<MyHomePage> {
  int _indexNavBar = 0;
  PageController pageCtrl = PageController(initialPage: 0);
  final List<List<String>> _dataPhone = const [
    ["Leanne Gaham", "365463745-346734"],
    ["Dwi", "12323213-7868767"],
    ["Nanda", "54656-34554734"],
    ["Rahmat", "0898756675-37867734"],
    ["Herlambang", "6570-9-2134334"],
    ["Alice Johnson", "5555555555"],
    ["Bob Wilson", "6666666666"],
    ["Eva Brown", "7777777777"],
  ];

  TextEditingController textController = TextEditingController();
  String submittedText = '';

  void _updateIndex(int index) {
    setState(() {
      _indexNavBar = index;
      pageCtrl.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
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
      body: Center(
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: pageCtrl,
          onPageChanged: (newIndex) {
            _updateIndex(newIndex);
          },
          children: [
            Hlmn1(
              textController: textController,
              submittedText: submittedText,
              onTextSubmit: () {
                setState(() {
                  submittedText = "HI," + textController.text;
                });
              },
              onNavigateToHlmn3: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Hlmn3Page()));
              },
            ),
            Hlmn2(dataPhone: _dataPhone),
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

class Hlmn1 extends StatelessWidget {
  final TextEditingController textController;
  final String submittedText;
  final VoidCallback onTextSubmit;
  final VoidCallback onNavigateToHlmn3;

  Hlmn1({
    required this.textController,
    required this.submittedText,
    required this.onTextSubmit,
    required this.onNavigateToHlmn3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 228, 228, 228),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20.0),
          Text(
            submittedText, // Show the submitted text here
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          Center(
            child: Container(
              width: 300,
              padding: EdgeInsets.only(top: 50, bottom: 50),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Nama Kamu',
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: onTextSubmit,
            child: Text('Submit'),
          ),
          ElevatedButton(
            onPressed: onNavigateToHlmn3,
            child: Text('Go to hlmn3'),
          ),
        ],
      ),
    );
  }
}

class Hlmn2 extends StatelessWidget {
  final List<List<String>> dataPhone;

  Hlmn2({required this.dataPhone});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 228, 228, 228),
      child: Column(
        children: <Widget>[
          for (int index = 0; index < dataPhone.length; index++)
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
                        dataPhone[index][0][0],
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
                        dataPhone[index][0],
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        dataPhone[index][1],
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
    );
  }
}
