import 'dart:developer';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(AppWidget2());
}

class AppWidget2 extends StatelessWidget {
  const AppWidget2({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
      home: ControllerInherited(child: const HomePage()),
    );
  }
}

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  int contador = 0;

  @override
  Widget build(BuildContext context) {
    print('build');
  final controller = ControllerInherited.of(context);
  return  Scaffold(
      appBar: AppBar(
        title: Text(
        'Masterclass 5',
        ),
      ),
      body: Center(
        child: Text('Contador ${controller.count}'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              controller.increment();
            });
          },
          child: Icon(Icons.add),
        ),
      );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class ControllerInherited extends InheritedWidget {
  ControllerInherited({required super.child});

  final controller = Controller();

  static Controller of(BuildContext context) {
    final controller =  context.dependOnInheritedWidgetOfExactType<ControllerInherited>()!.controller;
    return controller;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

}

class Controller {
  int count = 0;

  void increment() {
    count++;
  }
}

class AppWidget extends Widget {
  @override
  Element createElement() {
   return AppElement(this);
  }
}

class AppElement extends ComponentElement {
  AppElement(super.widget);

  @override
  Widget build() {
   return Container(
    alignment: Alignment.center,
    child: const Text('Masterclass 5', textDirection: TextDirection.ltr,),
   );
  }

}