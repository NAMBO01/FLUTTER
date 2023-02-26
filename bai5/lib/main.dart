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
  TextEditingController masv = new TextEditingController();
  TextEditingController hovaten = new TextEditingController();
  TextEditingController namsinh = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: masv,
                decoration: InputDecoration(labelText: " Mã sinh viên: "),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: hovaten,
                decoration: InputDecoration(labelText: " Họ và tên: "),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: namsinh,
                decoration: InputDecoration(labelText: " Năm sinh: "),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThongTinSinhVienPage(
                            maSinhVien: masv.text,
                            hoVaTen: hovaten.text,
                            namSinh: namsinh.text)));
              },
              color: Colors.green,
              child: Text(" Gửi thông tin đi"),
            )
          ],
        ),
      ),
    );
  }
}

class ThongTinSinhVienPage extends StatelessWidget {
  ThongTinSinhVienPage(
      {Key? key,
      required this.maSinhVien,
      required this.hoVaTen,
      required this.namSinh})
      : super(key: key);
  final String maSinhVien;
  final String hoVaTen;
  final String namSinh;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lab05_Thong_Tin_Sinh_Vien'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Colors.yellow,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Thông Tin Sinh Viên',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue),
                ),
              ),
            ),
            Text(
              "Mã Sinh Viên: " + maSinhVien,
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "Họ và tên: " + hoVaTen,
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "Năm sinh: " + namSinh,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
