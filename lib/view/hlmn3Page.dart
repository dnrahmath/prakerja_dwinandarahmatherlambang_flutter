import 'package:flutter/material.dart';

class Hlmn3Page extends StatefulWidget {
  @override
  _Hlmn3PageState createState() => _Hlmn3PageState();
}

class _Hlmn3PageState extends State<Hlmn3Page> {
  int number = 0; // Nilai awal angka

  void decrement() {
    setState(() {
      if (number > 0) {
        number--;
      }
    });
  }

  void increment() {
    setState(() {
      number++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 228, 228, 228),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            number.toString(),
            style: TextStyle(fontSize: 36.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: decrement,
                child: Icon(Icons.remove),
              ),
              SizedBox(width: 16.0), // Spasi antara tombol minus dan plus
              ElevatedButton(
                onPressed: increment,
                child: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
