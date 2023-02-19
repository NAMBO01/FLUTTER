import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int mayra;
  late int input;
  bool button1 = false;
  bool button2 = false;
  bool button3 = false;
  TextEditingController txtMayRa = new TextEditingController();
  TextEditingController txtKetQua = new TextEditingController();

  void XuLyMayRa() {
    setState(() {
      var rng = new Random();
      mayra = rng.nextInt(3);
      if (mayra == 0) {
        txtMayRa.text = "KEO";
      } else if (mayra == 1) {
        txtMayRa.text = "BUA";
      } else {
        txtMayRa.text = "BAO";
      }
      int kq = input - mayra;
      if (kq == 0) {
        txtKetQua.text = "HOA";
      } else if (kq == 1 || kq == -2) {
        txtKetQua.text = "THANG";
      } else {
        txtKetQua.text = "THUA";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.yellow,
              child: Center(
                child: Text(
                  "Bua - Keo - Bao",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: Center(
                child: Text(
                  "Ban ra gi??",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(48, 5, 0, 0),
              child: Row(
                // set the main axis alignment to divide space evenly
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          button1 = true;
                          button2 = false;
                          button3 = false;
                          input = 0;
                          XuLyMayRa();
                        });
                      },
                      focusColor: button1 ? Colors.red : Colors.blue,
                      child: Text("KEO"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          button1 = false;
                          button2 = true;
                          button3 = false;
                          input = 1;
                          XuLyMayRa();
                        });
                      },
                      focusColor: button1 ? Colors.red : Colors.blue,
                      child: Text("BUA"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          button1 = false;
                          button2 = false;
                          button3 = true;
                          input = 2;
                          XuLyMayRa();
                        });
                      },
                      focusColor: button3 ? Colors.red : Colors.blue,
                      child: Text("BAO"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Center(
                child: TextField(
                  controller: txtMayRa,
                  enabled: false,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  decoration: InputDecoration(labelText: 'May ra: '),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 240),
              child: Center(
                child: TextField(
                  controller: txtKetQua,
                  enabled: false,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(labelText: 'Ket qua: '),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FloatingActionButton(
                focusColor: Colors.green,
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: Text(" Nghi choi! "),
              ),
            )
          ],
        ),
      ),
    );
  }
}
