import 'package:flutter/material.dart';
import 'package:match_test/main.dart';
import 'package:match_test/userProfileData.dart';

class ShoppingHistory extends StatefulWidget {
  @override
  _ShoppingHistoryState createState() => _ShoppingHistoryState();
}

class _ShoppingHistoryState extends State<ShoppingHistory> {
  bool _hasHistory;

  @override
  void initState() {
    super.initState();
    UserData.previousPurchases.isEmpty
        ? _hasHistory = false
        : _hasHistory = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping History'),
      ),
      drawer: navDrawer(context),
      body: Column(
        children: <Widget>[
          _hasHistory
              ? Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: UserData.previousPurchases.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (UserData.previousPurchases[index].deliveryStatus ==
                              orderStatus[0] ||
                          UserData.previousPurchases[index].deliveryStatus ==
                              orderStatus[1]) {
                        return unfulfilledItemBox(
                            UserData.previousPurchases[index].name,
                            UserData.previousPurchases[index].imagePath,
                            UserData.previousPurchases[index].deliveryStatus);
                      } else {
                        return Padding(
                          padding: EdgeInsets.all(8),
                          child: ListTile(
                            leading: Image.asset('assets/images/rawr.png'),
                            title: Text(
                              UserData.previousPurchases[index].name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: Text(
                              orderStatus[2],
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.green,
                              ),
                            ),
                            subtitle: Text(
                                'Delivered ${UserData.previousPurchases[index].deliveredDate.month}/${UserData.previousPurchases[index].deliveredDate.day}/${UserData.previousPurchases[index].deliveredDate.year}'),
                          ),
                        );
                      }
                    },
                  ),
                )
              : Column(
                  children: <Widget>[
                    Text(
                      'There is No Shopping History',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
