import 'package:flutter/material.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<String> listButton = <String>[
    "M+",
    "M-",
    "MC",
    "AC",
    "7",
    "8",
    "9",
    "/",
    "4",
    "5",
    "6",
    "X",
    "1",
    "2",
    "3",
    "-",
    "0",
    ".",
    "=",
    "+",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SimpleCalculator"),
      ),
      body: Container(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              width: double.infinity,
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "0",
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: SizedBox(
                height: 200,
                child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 4,
                  children: List.generate(listButton.length, (index) {
                    return Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey[350],
                        child: Center(
                          child: Text(
                            listButton[index],
                            style: TextStyle(
                                color: xuLyMau(listButton[index]),
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Color xuLyMau(String tenButton) {
    if (tenButton == "M+" || tenButton == "M-" || tenButton == "MC") {
      return Colors.amber;
    }
    if (tenButton == "AC") return Colors.blue.shade800;
    if (tenButton == "/" ||
        tenButton == "X" ||
        tenButton == "-" ||
        tenButton == "+" ||
        tenButton == "+")
      return Colors.red;
    else
      return Colors.black;
  }
}
