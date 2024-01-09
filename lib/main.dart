import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/home_page/userdata.dart';
import 'package:todolist/text_page.dart';
import 'home_page/home_page.dart';


void main() async{

  //init the hive
  await Hive.initFlutter();

  //open the box
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TextPage(),
      theme: ThemeData(primarySwatch: Colors.grey),
    );
  }

}


