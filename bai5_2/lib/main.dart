import 'package:flutter/material.dart';
import 'dart:math';

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
      home: const MyHomePage(title: 'Lab05_DatHang'),
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
  List<TextEditingController> _controllers = <TextEditingController>[];
  List<MatHang> _listMatHang = <MatHang>[];
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
                  "ĐẶT HÀNG",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Expanded(
                child: SizedBox(
              child: ListView.builder(
                  itemCount: Random().nextInt(30),
                  itemBuilder: (BuildContext context, index) {
                    _controllers.add(new TextEditingController());
                    _listMatHang.add(new MatHang(
                        " Mặt Hàng $index", Random().nextInt(10000), 0));
                    _controllers[index].text =
                        _listMatHang[index].soLuong.toString();
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2)),
                      child: Row(
                        children: [
                          Container(
                            width: 250,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      _listMatHang[index].tenMonHang,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Đơn giá: " +
                                          _listMatHang[index].donGia.toString(),
                                      style: TextStyle(
                                          color: Colors.orangeAccent.shade400),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 50,
                                child: TextField(
                                  controller: _controllers[index],
                                  onChanged: (value) => _listMatHang[index]
                                      .soLuong = int.parse(value),
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                    );
                  }),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text("Warning"),
              content: Text("Xác nhận đơn hàng?"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, 'Hủy'),
                    child: Text('Hủy')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DonHangPage(
                                    listMatHang: _listMatHang,
                                  )));
                    },
                    child: Text('OK'))
              ],
            ),
          );
        },
        child: Icon(
          Icons.navigation,
        ),
      ),
    );
  }
}

class DonHangPage extends StatelessWidget {
  DonHangPage({Key? key, required this.listMatHang}) : super(key: key);
  final List<MatHang> listMatHang;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lab05_DatHang"),
      ),
      body: ListView.builder(
          itemCount: listMatHang.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(border: Border.all()),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(listMatHang[index].toString()),
              ),
            );
          }),
    );
  }
}

class MatHang {
  String tenMonHang;
  int donGia;
  int soLuong;

  MatHang(
    this.tenMonHang,
    this.donGia,
    this.soLuong,
  );
  String toString() {
    return "Tên Hàng: " +
        tenMonHang +
        " \n" +
        "Đơn giá: " +
        donGia.toString() +
        "\n" +
        " Số Lượng" +
        soLuong.toString() +
        "\n" +
        "Thành Tiền: " +
        (donGia * soLuong).toString();
  }
}
