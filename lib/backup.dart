//import 'dart:async';
//
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:permission_handler/permission_handler.dart';
//import 'package:sim_data/sim_data.dart';
//import 'package:ussd_service/ussd_service.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//enum RequestState {
//  Ongoing,
//  Success,
//  Error,
//}
//
//class _MyAppState extends State<MyApp> {
//  RequestState _requestState;
//  String _requestCode = "";
//  String _responseCode = "";
//  String _responseMessage = "Dear customer, Your account balance is 0.62 Birr . With this balance your account will expire on 15/04/2021. ethio telecom";
//
//  Iterable<String> filtered;
//
//  Future<void> sendUssdRequest() async {
//    setState(() {
//      _requestState = RequestState.Ongoing;
//    });
//    try {
//      String responseMessage;
//      await Permission.phone.request();
//      if (!await Permission.phone.isGranted) {
//        throw Exception("permission missing");
//      }
//
//      SimData simData = await SimDataPlugin.getSimData();
//      if (simData == null) {
//        throw Exception("sim data is null");
//      }
//      responseMessage = await UssdService.makeRequest(
//          simData.cards.first.subscriptionId, _requestCode);
//      setState(() {
//        final doubleRegex = RegExp(r'\s+(\d+\.\d+)\s+', multiLine: true);
//        filtered = doubleRegex.allMatches(responseMessage).map((m) => m.group(0));
//        _requestState = RequestState.Success;
//        _responseMessage = responseMessage;
//        print(responseMessage);
//      });
//    } catch (e) {
//      setState(() {
//        _requestState = RequestState.Error;
//        _responseCode = e is PlatformException ? e.code : "";
//        _responseMessage = e.message;
//      });
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: const Text('Ussd Plugin demo'),
//        ),
//        body: Container(
//          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//          child: Column(
//              crossAxisAlignment: CrossAxisAlignment.stretch,
//              children: <Widget>[
//                TextFormField(
//                  decoration: const InputDecoration(
//                    labelText: 'Enter Code',
//                  ),
//                  onChanged: (newValue) {
//                    setState(() {
//                      _requestCode = newValue;
//                    });
//                  },
//                ),
//                const SizedBox(height: 20),
//                MaterialButton(
//                  color: Colors.blue,
//                  textColor: Colors.white,
//                  onPressed: _requestState == RequestState.Ongoing
//                      ? null
//                      : () {
//                          sendUssdRequest();
//                        },
//                  child: const Text('Send Ussd request'),
//                ),
//                const SizedBox(height: 20),
//                if (_requestState == RequestState.Ongoing)
//                  Row(
//                    children: const <Widget>[
//                      SizedBox(
//                        width: 24,
//                        height: 24,
//                        child: CircularProgressIndicator(),
//                      ),
//                      SizedBox(width: 24),
//                      Text('Ongoing request...'),
//                    ],
//                  ),
//                if (_requestState == RequestState.Success) ...[
//                  const Text('Last request was successful.'),
//                  const SizedBox(height: 10),
//                  const Text('Response was:'),
//                  Text(
//                    _responseMessage,
//                    style: TextStyle(fontWeight: FontWeight.bold),
//                  ),
//                ],
//                if (_requestState == RequestState.Error) ...[
//                  const Text('Last request was not successful'),
//                  const SizedBox(height: 10),
//                  const Text('Error code was:'),
//                  Text(
//                    _responseCode,
//                    style: TextStyle(fontWeight: FontWeight.bold),
//                  ),
//                  const SizedBox(height: 10),
//                  const Text('Error message was:'),
//                  Text(
//                    _responseMessage,
//                    style: TextStyle(fontWeight: FontWeight.bold),
//                  ),
//                ]
//              ]),
//        ),
//      ),
//    );
//  }
//}