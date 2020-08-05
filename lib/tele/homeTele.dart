import 'package:ethio_ussd/models/hex_color.dart';
import 'package:ethio_ussd/widgets/tabView.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double money = 50.00;
  double balance = 80.24;

  Widget _getTeleTitle() {
     return Column(children: <Widget>[
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Image.asset(
           'images/tele.png',
           height: 36,
           width: 36,
         ),
       ),
       Text("\nCurrent Balance\n",
           style: TextStyle(
               fontFamily: 'roboto',
               color: Colors.white,
               fontSize: 18)),
     ]);
  }

  Widget _getCBETitle() {
     return Column(children: <Widget>[
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Image.asset(
           'images/cbe.png',
           height: 36,
           width: 36,
         ),
       ),
       Text("\nCurrent Balance\n",
           style: TextStyle(
               fontFamily: 'roboto',
               color: Colors.white,
               fontSize: 18)),
     ]);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Stack(
            children: <Widget>[
              Container(
                height: 300,
                decoration: BoxDecoration(
                    color: HexColor("292a2b"),
                    ),
              ),
              SafeArea(
                child: ListView(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              _getTeleTitle(),
                              Container(
                                decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        mediaQuery.width * 0.14),
                                    boxShadow: [
                                      new BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 6,
                                      )
                                    ]),

                                /// Outside Circle
                                child: CircleAvatar(
                                  radius: mediaQuery.width * 0.14,
                                  backgroundColor: Colors.transparent,
                                  child: CircleAvatar(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          balance.toString(),
                                          style: TextStyle(
                                              fontSize:
                                              mediaQuery.width / 2 * 0.12,
                                              color: Colors.white,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Birr',
                                          style: TextStyle(
                                              fontSize:
                                              mediaQuery.width / 2 * 0.12,
                                              color: Colors.white,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    radius: mediaQuery.width * 0.14,
                                    backgroundColor: HexColor("292a2b"),
                                  ),
                                ),
                              ),
//                              Text("\nYour cards", style: TextStyle(color: Colors
//                                  .white.withOpacity(0.5), fontSize: 18)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              _getCBETitle(),
                              Container(
                                decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        mediaQuery.width * 0.14),
                                    boxShadow: [
                                      new BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 6,
                                      )
                                    ]),

                                /// Outside Circle
                                child: CircleAvatar(
                                    radius: mediaQuery.width * 0.14,
                                    backgroundColor: Colors.transparent,
                                    child: CircleAvatar(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            balance.toString(),
                                            style: TextStyle(
                                                fontSize:
                                                    mediaQuery.width / 2 * 0.12,
                                                color: Colors.white,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Birr',
                                            style: TextStyle(
                                                fontSize:
                                                    mediaQuery.width / 2 * 0.12,
                                                color: Colors.white,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      radius: mediaQuery.width * 0.14,
                                      backgroundColor: HexColor("292a2b"),
                                    )),
                              ),
//                              Text("\nYour cards", style: TextStyle(color: Colors
//                                  .white.withOpacity(0.5), fontSize: 18)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TabView(),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Recent transactions",
                            style: TextStyle(),
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      onTap: () {
                        _settingModalBottomSheet(context);
                      },
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("images/p3.jpg"),
                      ),
                      title: RichText(
                          text: TextSpan(children: [
                        TextSpan(text: 'Marley Geremy\n'),
                        TextSpan(
                            text: 'Money Sent - Today 9AM',
                            style: TextStyle(fontSize: 14, color: Colors.grey))
                      ], style: TextStyle(color: Colors.black, fontSize: 18))),
                      trailing: Text(
                        "- \$430",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        _settingModalBottomSheet(context);
                      },
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("images/p2.jpg"),
                      ),
                      title: RichText(
                          text: TextSpan(children: [
                        TextSpan(text: 'Jason Martin\n'),
                        TextSpan(
                            text: 'Money received - Today 12PM',
                            style: TextStyle(fontSize: 14, color: Colors.grey))
                      ], style: TextStyle(color: Colors.black, fontSize: 18))),
                      trailing: Text(
                        "+ \$220",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                Colors.white,
                Colors.white.withOpacity(0.1),
              ])),
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Dashboard",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Cards",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "History",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Settings",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Profile",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
              ),
            ],
          ),
        ));
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            child: new Wrap(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("images/p2.jpg"),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Jason Martin",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text("Amount to send"),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                          onTap: () {
                            if (money != 0) {
                              money -= 10;
                            }
                          },
                          child: CircleAvatar(
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            radius: 20,
                            backgroundColor: Colors.grey,
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "$money",
                      style:
                          TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              money += 10;
                            });
                          },
                          child: CircleAvatar(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            radius: 20,
                            backgroundColor: Colors.grey,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: HexColor("60282e"),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            "Send Money",
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
