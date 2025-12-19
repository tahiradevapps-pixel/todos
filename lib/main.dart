import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/ApiScreen.dart';
import 'package:flutter_application_1/view/CommentWithmodel_view.dart';
import 'package:flutter_application_1/view/tabBarScreen.dart';
import 'package:flutter_application_1/view/todos_view.dart';
import 'package:flutter_application_1/view/todoswithModel_view.dart';
import 'package:flutter_application_1/view/upcome_toprate_movies.dart';
import 'package:flutter_application_1/view/upcomingMovie_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        
      ),
      home: UpcomeToprateMovies(),
    );
  }
}
  
