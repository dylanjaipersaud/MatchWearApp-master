import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:match_test/marketPlace.dart';
import 'package:match_test/userProfile.dart';
import 'package:match_test/userProfileData.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/matchrot.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Color(0xffb99877).withOpacity(1.0), BlendMode.color),
              ),
            ),
            child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(
                  'assets/images/match_logo_white.png',
                  height: 175.0,
                  fit: BoxFit.fitHeight,
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 10.0, bottom: 7.0),
                  child: TextFormField(
                    maxLines: 1,
                    minLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.white)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.white)
                      ),
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 7.0, bottom: 7.0),
                  child: TextFormField(
                    maxLines: 1,
                    minLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.white)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.white)
                      ),
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 5.0),
                  child: FloatingActionButton(
                    //shape: ,

                    onPressed: () {
                      UserData('Your Name', 66);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MarketPlace()));
                    },

                    //color: Colors.yellow[500],
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20,
                        ),
                      ),
                      TextSpan(
                          text: 'Create One',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),),
    );
  }
}
