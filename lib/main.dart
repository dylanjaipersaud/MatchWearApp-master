import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:match_test/loginPage.dart';
import 'package:match_test/marketPlace.dart';
import 'package:match_test/userProfile.dart';
import 'package:match_test/shoppingHistory.dart';
import 'package:match_test/wishList.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

Widget navDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Container(
              child: Image.asset("assets/images/match_logo_black.png")),
          decoration: BoxDecoration(
            //border: Border(bottom: BorderSide(color: Colors.black,width: 4)),
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1,0.2,0.3, 0.4, 0.5, 0.7, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                //Colors.pink[800],
                Colors.yellow[700],
                Colors.yellow[600],
                Colors.yellow[500],
                Colors.yellow[400],
                Colors.yellow[300],
                Colors.yellow[200],
                Colors.yellow[100],
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.store, size: 30, color: Colors.black87,),
          title: Text(
            'Marketplace',
            style: TextStyle(
              fontSize: 22.0,
              fontFamily: "Roberto",
            fontWeight: FontWeight.bold,
            color: Colors.black87),
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => MarketPlace()));
          },
        ),
        Divider(
          color: Colors.black,
          thickness: 1,
        ),
        ListTile(
          leading: Icon(Icons.person, size: 30,color: Colors.black87,),
          title: Text(
            'Profile',
            style:  TextStyle(
                fontSize: 22.0,
                fontFamily: "Roberto",
                color: Colors.black87,
            fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => UserProfile()));
          },
        ),
        Divider(
          color: Colors.black,
          thickness: 1,
        ),
        ListTile(
          leading: Icon(Icons.shopping_basket, size: 30, color: Colors.black),
          title: Text(
            'Shopping History',
            style:  TextStyle(
                fontSize: 22.0,
                fontFamily: "Roberto",
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => ShoppingHistory()));
          },
        ),
        Divider(
          color: Colors.black,
          thickness: 1,
        ),
        ListTile(
          leading: Icon(Icons.favorite, size: 30, color: Colors.black87,),
          title: Text(
            'Wishlist',
            style:  TextStyle(
                fontSize: 22.0,
                fontFamily: "Roberto",
                color: Colors.black87,
            fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => WishList()));
          },
        ),
        Divider(
          color: Colors.black,
          thickness: 1,
        ),
        ListTile(
          leading: Icon(Icons.info, size: 30, color: Colors.black87,),
          title: Text(
            'About Us',
            style:  TextStyle(
                fontSize: 22.0,
                fontFamily: "Roberto",
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => WishList()));
          },
        ),
      ],
    ),
  );
}
