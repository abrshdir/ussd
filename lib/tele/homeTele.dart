import 'package:ethio_ussd/models/hex_color.dart';
import 'package:ethio_ussd/widgets/blance-refresh.dart';
import 'package:ethio_ussd/widgets/bottom-bar.dart';
import 'package:ethio_ussd/widgets/recent-transactions.dart';
import 'package:ethio_ussd/widgets/tab-view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: mediaQuery.height,
          decoration: BoxDecoration(
            color: HexColor("292a2b"),
          ),
          child: SafeArea(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                BalanceRefresher(),
                SizedBox(
                  height: 15,
                ),
                /// Tabview widget
                TabView(),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Recent transactions",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        )),
                      ),
                    ),
                  ],
                ),
                RecentTransactions()
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomBar());
  }

}
