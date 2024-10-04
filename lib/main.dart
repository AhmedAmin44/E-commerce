import 'package:flutter/material.dart';
import 'package:test1/widgets/SizeOverlay.dart';
import 'package:test1/widgets/bar_sort.dart';
import 'package:test1/widgets/filtter_widget.dart';
import 'package:test1/widgets/product_gridview.dart';
import 'package:test1/widgets/responsive_tagcontainer.dart';
import 'package:test1/screens/search_detailes.dart';
import 'screens/search.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SearchDetailes(), // Use the Search widget here
        
      ),
    );
  }
}
