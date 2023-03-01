import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      home: const MyHomePage(title: 'Lab04_DanhSachLop'),
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
  List<String> list = <String>[
    "Trịnh Văn Lê - DH9865541",
    "Huỳnh Hồng Ngọc - DH9865542",
    "Vương Thái Xuyên - DH9865543",
    "Hằng Lợi Liên - DH9865544",
    "Đoàn Thị Lệ Minh - DH9865545",
    "Lý Chánh Vân - DH9865546",
    "Trần Phương Vỹ - DH9865547",
    "Nguyễn Hữu Lợi - DH9865548",
  ];
  int _groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onLongPress: () {
                Fluttertoast.showToast(
                    msg: "Bạn đã nhấn lâu lần vào " + list[index],
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              child: RadioListTile(
                title: Text(list[index]),
                value: index,
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value!;
                    Fluttertoast.showToast(
                        msg: "Bạn đã nhấn 1 lần vào " + list[index],
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
