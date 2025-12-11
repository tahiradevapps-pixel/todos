import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/ApiScreen.dart';
import 'package:flutter_application_1/view/todos_view.dart';
import 'package:flutter_application_1/view/todoswithModel_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ApiwithModelscreen(),
    );
  }
}
  
