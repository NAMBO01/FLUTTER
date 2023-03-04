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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late Animation _arrowAnimation, _heartAnimation;
  late AnimationController _arrowAnimationController, _heartAnimationController;
  @override
  void initState() {
    super.initState();
    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(microseconds: 300));
    _arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);
    _heartAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _heartAnimation = Tween(begin: 150.0, end: 170.0).animate(CurvedAnimation(
        curve: Curves.bounceOut, parent: _heartAnimationController));
    _heartAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _heartAnimationController.repeat(reverse: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("lab06_animation"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          firstChild(),
          SizedBox(
            height: 50.0,
          ),
          secondChild(),
        ],
      ),
    );
  }

  Widget firstChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        AnimatedBuilder(
          animation: _arrowAnimationController,
          builder: (context, child) => Transform.rotate(
            angle: _arrowAnimation.value,
            child: Icon(
              Icons.expand_more,
              size: 50.0,
              color: Colors.black,
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            _arrowAnimationController.isCompleted
                ? _arrowAnimationController.reverse()
                : _arrowAnimationController.forward();
          },
          splashColor: Colors.red,
          color: Colors.green,
          textColor: Colors.black,
          padding: const EdgeInsets.all(12.0),
          child: Text('quay mũi tên'),
        )
      ],
    );
  }

  Widget secondChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: AnimatedBuilder(
              animation: _heartAnimationController,
              builder: (context, child) {
                return Center(
                  child: Container(
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: _heartAnimation.value,
                      ),
                    ),
                  ),
                );
              }),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: MaterialButton(
            onPressed: () {
              _heartAnimationController.forward();
            },
            splashColor: Colors.red,
            padding: const EdgeInsets.all(12.0),
            color: Colors.red,
            textColor: Colors.black,
            child: Text('Cho tim đập'),
          ),
        ))
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _arrowAnimationController?.dispose();
    _heartAnimationController?.dispose();
  }
}
