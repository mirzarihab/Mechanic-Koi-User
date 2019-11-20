import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app3/mapPage.dart';
import 'package:flutter_app3/homepage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:flutter_app3/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
FirebaseUser user;

void main(){
  runApp(MaterialApp(
    home: splashscreen(),
  ));
}
class splashscreen extends StatefulWidget {

  @override
  _splashscreenState createState() => _splashscreenState();

}

class _splashscreenState extends State<splashscreen> {

  String id;
  @override
  void initState() {
    // chk();
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4),
        ()=>chk());

           // ()=>

            //Navigator.push(context,
           //     MaterialPageRoute(builder: (context)=>LoginPage())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.blueAccent
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 60.0,
                          child: Image.asset('images/splashicon.png'),
                        )
                      ],
                    ),
                  )),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(backgroundColor: Colors.white,),
                    Padding(padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text("Mechanic Everywhere",style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),)
                  ],
                ),
              )
            ],
          )
        ],
      ),

    );

  }

void chk() async {
    user = await FirebaseAuth.instance.currentUser();
    print("sfzf");
    print("dzff");
    if(user!=null){
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => homepage()));
    }
    else{
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => LoginPage()));
    };

    //chk2();
    }


}

