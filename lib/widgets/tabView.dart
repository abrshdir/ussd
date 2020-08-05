import 'package:ethio_ussd/models/hex_color.dart';
import 'package:flutter/material.dart';

class TabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Container(
      width: 100,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
              color: Colors.white,
          )
        ]),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: HexColor("292a2b"),
        shadowColor: Colors.white,
        elevation: 10,
        child: TabBar(tabs: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
                width: mediaQuery.width * 0.25,
                child: Text('ክፍል ፩',
                    style: Theme.of(context).textTheme.subtitle1)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
                width: mediaQuery.width * 0.25,
                child: Text('ክፍል ፪',
                    style: Theme.of(context).textTheme.subtitle1)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
                width: mediaQuery.width * 0.25,
                child: Text('ክፍል ፫',
                    style: Theme.of(context).textTheme.subtitle1)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(
                width: mediaQuery.width * 0.25,
                child: Text('ክፍል ፬',
                    style: Theme.of(context).textTheme.subtitle1)),
          ),
        ]),
      ),
    );
  }
}