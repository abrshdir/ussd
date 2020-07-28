import 'package:ethio_ussd/tele/homeTele.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Money Transfer',
        theme: ThemeData(
          primarySwatch: Colors.red,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'
        ),
        home: Home(),
      );
  }

}