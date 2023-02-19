import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('LAB 1'),
        ),
        body: Center(
          child: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  TextEditingController heSoAController = new TextEditingController();
  TextEditingController heSoBController = new TextEditingController();
  TextEditingController heSoCController = new TextEditingController();
  TextEditingController ketQuaController = new TextEditingController();
  TextEditingController X1Controller = new TextEditingController();
  TextEditingController X2Controller = new TextEditingController();
  TextEditingController DeltaController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Stack(children: <Widget>[
            Text(
              'Giai pt bac 2',
              style: TextStyle(
                  fontSize: 30,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 6
                    ..color = Colors.blue),
            ),
            Text('Giai pt bac 1',
                style: TextStyle(fontSize: 30, color: Colors.blue[300]))
          ]),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
            child: TextField(
              controller: heSoAController,
              style: TextStyle(fontSize: 18, color: Colors.black),
              decoration: InputDecoration(
                labelText: 'he so a',
                labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
            child: TextField(
              controller: heSoBController,
              style: TextStyle(fontSize: 18, color: Colors.black),
              decoration: InputDecoration(
                labelText: 'He so b',
                labelStyle: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: TextField(
              controller: heSoCController,
              style: TextStyle(fontSize: 18, color: Colors.black),
              decoration: InputDecoration(
                labelText: 'He so c',
                labelStyle: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: FloatingActionButton(
                  onPressed: (timNghiemX),
                  focusColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Text(
                    'Tim nghiem X',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: TextField(
                controller: ketQuaController,
                style: TextStyle(fontSize: 20, color: Colors.black),
                enabled: false,
                decoration: InputDecoration(
                  labelText: " Ket qua ",
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: TextField(
                controller: X1Controller,
                style: TextStyle(fontSize: 20, color: Colors.black),
                enabled: false,
                decoration: InputDecoration(
                  labelText: " Nghiem X1 ",
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: TextField(
                controller: X2Controller,
                style: TextStyle(fontSize: 20, color: Colors.black),
                enabled: false,
                decoration: InputDecoration(
                  labelText: " Nghiem X2 ",
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void timNghiemX() {
    setState(() {
      // if (double.parse(heSoAController.text) == 0) {
      //   if (double.parse(heSoBController.text) == 0) {
      //     ketQuaController.text = "Phuong trinh vo nghiem";
      //   } else {
      //     ketQuaController.text = (-(double.parse(heSoCController.text) /
      //             double.parse(heSoBController.text)))
      //         .toString();
      //   }
      // }
      DeltaController.text = ((double.parse(heSoBController.text) *
                  double.parse(heSoBController.text)) -
              (4 *
                  double.parse(heSoAController.text) *
                  double.parse(heSoCController.text)))
          .toString();
      if (double.parse(DeltaController.text) > 0) {
        ketQuaController.text = "Phương trình có hai nghiệm phân biệt";
        X1Controller.text = (((double.parse(heSoBController.text)) +
                    sqrt(double.parse(DeltaController.text))) /
                (2 * double.parse(heSoAController.text)))
            .toString();
        X2Controller.text = ((-(double.parse(heSoBController.text)) +
                    sqrt(double.parse(DeltaController.text))) /
                (2 * double.parse(heSoAController.text)))
            .toString();
      } else if (double.parse(DeltaController.text) == 0) {
        ketQuaController.text = "Phương trình có nghiệm kép";
        X1Controller.text = ((-(double.parse(heSoBController.text))) /
                (2 * double.parse(heSoAController.text)))
            .toString();
        X2Controller.text = ((-(double.parse(heSoBController.text))) /
                (2 * double.parse(heSoAController.text)))
            .toString();
      } else {
        ketQuaController.text = "Phương trình vô nghiệm";
        X1Controller.text = 0.toString();
        X2Controller.text = 0.toString();
      }
    });
  }
}
