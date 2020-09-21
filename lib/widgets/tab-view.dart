import 'package:flutter/material.dart';

class TabView extends StatefulWidget {

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  var money = 50.00;

  var balance = 80.24;
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
              backgroundColor: Colors.grey,
              appBar: AppBar(
                backgroundColor: Colors.black38,
                title: TabBar(
                  tabs: [
                    Tab(
                      icon: Image.asset(
                        'images/tele.png',
                        height: 25,
                        width: 25,
                      ),
                    ),
                    Tab(
                        icon: Image.asset(
                      'images/cbe.png',
                      height: 25,
                      width: 25,
                    )),
                  ],
                ),
              ),
              body: tabView(),
            ),
          ),
        ),
      ),
    );
  }

  Widget tabView() {
    return TabBarView(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return;
              },
              child: ListView(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Ethio Gebeta',
                          style: TextStyle(color: Colors.white),
                        ),
                        RaisedButton(
                          child: Text('Package'),
                          color: Colors.white,
                          onPressed: () {
                            packageBuy(context);
                          },
                        ),
                        RaisedButton(
                          child: Text('Stay home'),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        RaisedButton(
                          child: Text('Unlimited'),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Others',
                          style: TextStyle(color: Colors.white),
                        ),
                        RaisedButton(
                          child: Text('Transfer'),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        RaisedButton(
                          child: Text('Call me back'),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        RaisedButton(
                          child: Text('Recharge'),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Others',
                          style: TextStyle(color: Colors.white),
                        ),
                        RaisedButton(
                          child: Text('Buy Package'),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        RaisedButton(
                          child: Text('Buy Package'),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        RaisedButton(
                          child: Text('Buy Package'),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
        Icon(Icons.directions_transit),
      ],
    );
  }



  void packageBuy(context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(26),
          ),
        ),
        builder: (BuildContext bc) {

          List<Step> steps = [
            Step(
              title: const Text('New Account'),
              isActive: true,
              state: StepState.complete,
              content: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email Address'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                ],
              ),
            ),
            Step(
              isActive: false,
              state: StepState.editing,
              title: const Text('Address'),
              content: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Home Address'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Postcode'),
                  ),
                ],
              ),
            ),
            Step(
              state: StepState.error,
              title: const Text('Avatar'),
              subtitle: const Text("Error!"),
              content: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.red,
                  )
                ],
              ),
            ),
          ];

          int currentStep = 0;
          bool complete = false;

          goTo(int step) {
            setState(() => currentStep = step);
          }

          next() {
            print('$currentStep');
            print('next');
            currentStep + 1 != steps.length
                ? goTo(currentStep + 1)
                : setState(() {complete = true; print(complete); });
          }

          cancel() {
            if (currentStep > 0) {
              goTo(currentStep - 1);
            }
          }


          return StatefulBuilder(
            builder: (BuildContext context, setState) => Container(
//            color: Colors.lightGreen,
              child: Column(
                children: <Widget>[
                  Text('$currentStep'),
                  Expanded(
                    child: Stepper(
                      steps: steps,
                      type: StepperType.vertical,
                      currentStep: currentStep,
                      onStepContinue: next,
                      onStepTapped: (step) => goTo(step),
                      onStepCancel: cancel,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
//  void packageBuy(context) {
//    var mediaQuery = MediaQuery.of(context).size;
//
//    print(context);
//    showModalBottomSheet(
//        context: context,
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.vertical(
//            top: Radius.circular(26),
//          ),
//        ),
//        builder: (BuildContext bc) {
//          return Container(
//            child: new Wrap(
//              children: <Widget>[
//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Center(
//                    child: ClipRRect(
//                      borderRadius: BorderRadius.circular(21),
//                      child: GestureDetector(
//                        onTap: () {
//                          Navigator.pop(context);
//                        },
//                        child: Container(
//                          height: 5,
//                          width: mediaQuery.width * 0.2,
//                          color: Colors.lightBlueAccent,
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: CircleAvatar(
//                        radius: 25,
//                        backgroundImage: AssetImage("images/p2.jpg"),
//                      ),
//                    ),
//                  ],
//                ),
//                Container(
//                  alignment: Alignment.center,
//                  child: Text(
//                    "Jason Martin",
//                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                  ),
//                ),
//                Container(
//                  alignment: Alignment.center,
//                  child: Text("Amount to send"),
//                ),
//                SizedBox(
//                  height: 5,
//                ),
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.all(2.0),
//                      child: InkWell(
//                          onTap: () {
//                            if (money != 0) {
//                              money -= 10;
//                            }
//                          },
//                          child: CircleAvatar(
//                            child: Icon(
//                              Icons.remove,
//                              color: Colors.white,
//                            ),
//                            radius: 20,
//                            backgroundColor: Colors.grey,
//                          )),
//                    ),
//                    SizedBox(
//                      width: 10,
//                    ),
//                    Text(
//                      "$money",
//                      style:
//                      TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
//                    ),
//                    SizedBox(
//                      width: 10,
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(2.0),
//                      child: InkWell(
//                          onTap: () {
//                            setState(() {
//                              money += 10;
//                            });
//                          },
//                          child: CircleAvatar(
//                            child: Icon(
//                              Icons.add,
//                              color: Colors.white,
//                            ),
//                            radius: 20,
//                            backgroundColor: Colors.grey,
//                          )),
//                    ),
//                  ],
//                ),
//                SizedBox(
//                  height: 10,
//                ),
//                Padding(
//                  padding: const EdgeInsets.all(16),
//                  child: InkWell(
//                    onTap: () {
//                      Navigator.pop(context);
//                    },
//                    child: Container(
//                      alignment: Alignment.center,
//                      decoration: BoxDecoration(
//                          color: HexColor("60282e"),
//                          borderRadius: BorderRadius.circular(10)),
//                      child: Center(
//                        child: Padding(
//                          padding: const EdgeInsets.all(12),
//                          child: Text(
//                            "Send Money",
//                            style: TextStyle(fontSize: 22, color: Colors.white),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                )
//              ],
//            ),
//          );
//        });
//  }
}

