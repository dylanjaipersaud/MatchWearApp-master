import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:match_test/userProfileData.dart';
import 'package:match_test/main.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool _hasOrdersShipping = false;

  @override
  void initState() {
    for (BoughtItem i in UserData.previousPurchases) {
      if (i.deliveryStatus == orderStatus[0] ||
          i.deliveryStatus == orderStatus[1]) {
        _hasOrdersShipping = true;
        break;
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.yellow[400],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
            iconSize: 30.0,
          ),
        ],
        title: Text(
          'Your Profile',
          style:TextStyle(
              color: Colors.black87,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "Roberto")),
        ),

      drawer: navDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        0.0,
                        0.99
                      ],
                      colors: [
                        Colors.yellow[400],
                        Colors.pinkAccent,
                      ]),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 15.0, bottom: 10.0),
                      child: CircularPercentIndicator(
                        radius: 300.0,
                        lineWidth: 15.0,
                        percent: UserData.loyalty / 100.0,
                        progressColor: Colors.green,
                        backgroundColor: Colors.white,
                        center: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(500.0),
                            child: Image.asset('assets/images/rawr.png'),
                            //Images here MUST be in a 1:1 ratio!!!!
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        UserData.name,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roberto",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'Points until next reward: ${100 - UserData.loyalty}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          fontFamily: "Acme",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
//            Divider(
//              color: Colors.black,
//              thickness: 1,
//            ),
            Center(
              child: Container(
                padding: EdgeInsets.only(top:8),
                //margin: EdgeInsets.only(top: 4.0, left: 15.0),
                child: Text(
                  'Unfulfilled Orders',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    fontFamily: "Acme",
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Container(
                decoration:
                BoxDecoration(
//                   border: Border.all(
//                     color: Colors.black,
//                     width: 3,
//                   ),
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.grey,
                ),
                constraints: BoxConstraints(
                  minHeight: 200.0
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _unfulfilledOrderBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _unfulfilledOrderBox() {
    if (_hasOrdersShipping)
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (BoughtItem i in UserData.previousPurchases)
            if (i.deliveryStatus == orderStatus[0] ||
                i.deliveryStatus == orderStatus[1])
              unfulfilledItemBox(
                  i.name, i.imagePath, i.deliveryStatus),
        ],
      );
    return Container(
      height: 200.0,
      child: Center(
        child: Text(
          'All Orders are Fulfilled',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
