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
      home: const MyHomePage(title: 'Lab02_fibonacci'),
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
  TextEditingController heSoN = new TextEditingController();
  String textHolder = "";
  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: heSoN,
                decoration: InputDecoration(
                  labelText: 'Nhap N',
                ),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                setState(() {
                  int n = int.parse(heSoN.text);
                  List<int> fibos = <int>[1];
                  if (n > 1) fibos.add(1);
                  if (n > 2) {
                    for (int i = 2; i < n; i++) {
                      fibos.add(fibos[i - 1] + fibos[i - 2]);
                    }
                  }
                  textHolder = fibos.join('\n');
                });
              },
              child: Text('Tao day Fibo'),
            ),
            Text(
              'Danh sach day Fibo: ',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            Expanded(
                flex: 1,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text("$textHolder"))),
          ],
        ),
      ),
    );
  }
}
