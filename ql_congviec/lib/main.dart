import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      home: const MyHomePage(title: 'Lab04_QuanLyCongViec'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CongViec> list = <CongViec>[];
  TextEditingController tenCongViecController = new TextEditingController();
  DateTime selectedDate = DateTime.now();
  String selectedTime = DateFormat('kk:mm').format(DateTime.now());

  void clearInput() {
    selectedDate = DateTime.now();
    selectedTime = DateFormat('kk:mm').format(DateTime.now());
    tenCongViecController.clear();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2023, 2),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectedTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedDate = picked.format(context) as DateTime;
      });
    }
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
              color: Colors.yellow,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Quản lý công việc",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: Colors.red),
                controller: tenCongViecController,
                decoration: InputDecoration(labelText: "Tên công việc:"),
              ),
            ),

            /// Creating a row with two widgets. The first widget is a RichText widget that displays the
            /// date. The second widget is a RawMaterialButton that displays a calendar icon. When the
            /// user clicks on the calendar icon, the _selectDate function is called.
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 250,
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Ngay:      ",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        TextSpan(
                            text: DateFormat('dd-MM-yyyy')
                                .format(selectedDate)
                                .toString(),
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ]),
                    ),
                  ),
                  Container(
                    width: 50,
                    child: RawMaterialButton(
                        child: Icon(Icons.calendar_today, size: 15),
                        padding: EdgeInsets.all(8.0),
                        fillColor: Colors.red.shade500,
                        elevation: 2.0,
                        shape: CircleBorder(),
                        onPressed: () {
                          _selectDate(context);
                        }),
                  ),
                ],
              ),
            ),

            /// Creating a row with two widgets. The first widget is a RichText widget that displays the
            /// selected time. The second widget is a RawMaterialButton that displays an icon.
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Container(
                    width: 250,
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Giờ:      ",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        TextSpan(
                          text: selectedTime,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        TextSpan(
                          text: selectedTime,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )
                      ]),
                    ),
                  ),
                  Container(
                    width: 50,
                    child: RawMaterialButton(
                      child: Icon(Icons.watch_later, size: 15),
                      padding: EdgeInsets.all(8.0),
                      fillColor: Colors.red.shade500,
                      elevation: 2.0,
                      shape: CircleBorder(),
                      onPressed: () {
                        _selectedTime(context);
                      },
                    ),
                  ),
                ],
              ),
            ),

            /// Creating a list of CongViec objects.
            Expanded(
                child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: SizedBox(
                child: list.length > 0
                    ? ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                tenCongViecController.text =
                                    list[index].tenCongViec;
                                selectedDate = list[index].ngay;
                                selectedTime = list[index].gio;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                list[index].toString(),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                          );
                        })
                    : Center(
                        child: Text("No item"),
                      ),
              ),
            )),

            Align(
              alignment: Alignment.centerRight,
              child: RawMaterialButton(
                  child: Icon(
                    Icons.add,
                    size: 20,
                  ),
                  fillColor: Colors.red.shade500,
                  elevation: 2.0,
                  shape: CircleBorder(),
                  onPressed: () {
                    setState(() {
                      bool isAdded = false;
                      if (list.length == 0) {
                        list.add(new CongViec(tenCongViecController.text,
                            selectedDate, selectedTime));
                        clearInput();
                      } else {
                        for (int i = 0; i < list.length; i++) {
                          if (list[i]
                                  .tenCongViec
                                  .compareTo(tenCongViecController.text) ==
                              0) {
                            list[i].ngay = selectedDate;
                            list[i].gio = selectedTime;
                            clearInput();
                            isAdded = true;
                          }
                        }
                      }
                      if (isAdded) {
                        list.add(new CongViec(tenCongViecController.text,
                            selectedDate, selectedTime));
                        clearInput();
                      }
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class CongViec {
  String tenCongViec;
  DateTime ngay;
  String gio;
  CongViec(this.tenCongViec, this.ngay, this.gio);
  String toString() {
    return this.tenCongViec +
        " - " +
        DateFormat('dd-MM-yyyy').format(ngay) +
        " - " +
        gio;
  }
}
