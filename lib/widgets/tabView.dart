import 'package:ethio_ussd/models/hex_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height * 0.4,
      width: mediaQuery.width,
      child: DefaultTabController(
        length: 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            child: Scaffold(
              backgroundColor: Colors.black12,
              appBar: AppBar(
                backgroundColor: Colors.black38,
                title: TabBar(
                  tabs: [
                    Tab(icon: Image.asset(
                      'images/tele.png',
                      height: 25,
                      width: 25,
                    ),),
                    Tab(icon: Image.asset(
                      'images/cbe.png',
                      height: 25,
                      width: 25,
                    ),),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text('Ethio Gebeta', style: TextStyle(color: Colors.white),),
                              RaisedButton(child: Text('Package'), color: Colors.white, onPressed: () {},),
                              RaisedButton(child: Text('Stay home'), color: Colors.white, onPressed: () {},),
                              RaisedButton(child: Text('Unlimited'), color: Colors.white, onPressed: () {},),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text('Others', style: TextStyle(color: Colors.white),),
                              RaisedButton(child: Text('Transfer'), color: Colors.white, onPressed: () {},),
                              RaisedButton(child: Text('Call me back'), color: Colors.white, onPressed: () {},),
                              RaisedButton(child: Text('Recharge'), color: Colors.white, onPressed: () {},),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text('Others', style: TextStyle(color: Colors.white),),
                              RaisedButton(child: Text('Buy Package'), color: Colors.white, onPressed: () {},),
                              RaisedButton(child: Text('Buy Package'), color: Colors.white, onPressed: () {},),
                              RaisedButton(child: Text('Buy Package'), color: Colors.white, onPressed: () {},),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Icon(Icons.directions_transit),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
