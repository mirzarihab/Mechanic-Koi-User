import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app3/maincart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_app3/car.dart';
import 'package:flutter_app3/mapPage.dart';
import 'package:poly/poly.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'signin.dart';
//library flutter_google_places_autocomplete.src;
import 'dart:async';
import 'dart:core';
import 'dart:core' as prefix0;
import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as prefix2;
import 'package:url_launcher/url_launcher.dart';
import 'package:launch_review/launch_review.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:mechanic_koi_mechanic/signin.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_webservice/places.dart' ;
import 'package:google_maps_webservice/directions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import 'package:gms_path/gms_path.dart';
import 'package:flutter_app3/google_maps_requests.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:mechanic_koi_mechanic/drawPoly.dart';
import 'package:poly/poly.dart';


var currentCar = carList.cars[0];

class homepage extends StatefulWidget {

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  showExitPopup() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Confirm"),
            content: Text("Do you want to exit"),
            actions: <Widget>[
              RaisedButton(
                  child: Text("No"),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              RaisedButton(
                  child: Text("Yes"),
                  color: Colors.white,
                  onPressed: () {
                    SystemNavigator.pop();
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          showExitPopup();
        },
        child: Scaffold(
          appBar: AppBar(
            // Icon(Icons.notifications),
            title: Text("Mechanic koi?"),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    PopupMenuItem(
                      value: 1,
                      child: Text("First"),
                    );
                    PopupMenuItem(
                      value: 2,
                      child: Text("Second"),
                    );
                  })
            ],
          ),
          drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: <Color>[Colors.indigo, Colors.blueAccent])),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Material(
                              borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              elevation: 10,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'images/splashicon.png',
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                            ),
                            Text(
                              "name",
                              style: TextStyle(color: Colors.white, fontSize: 20.0),
                            ),
                            Text(
                              'email',
                              style: TextStyle(color: Colors.white, fontSize: 15.0),
                            )
                          ],
                        ),
                      )),
                  CustomListTile(Icons.person, "Profile", () => {}),
                  //CustomListTile(Icons.notifications,"Notification",()=>{}),
                  CustomListTile(FontAwesomeIcons.medal, "Meadls", () => {}),
                  CustomListTile(Icons.library_books, "History", () => {}),
                  CustomListTile(Icons.credit_card, "Payment", () => {}),
                  CustomListTile(Icons.settings, "Settings", () => {}),
                  CustomListTile(Icons.exit_to_app, "LogOut", () => logOut()),

                  //footer section
                  Material(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 25.0, 0.0, 0.0),
                      child: Center(
                        child: Text(
                          "Connect With Us",
                          style: TextStyle(fontSize: 18.0, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),

                  Material(
                    child: Container(
                      //margin: EdgeInsets.symmetric(horizontal: 80.0),
                      margin: EdgeInsets.fromLTRB(80.0, 0.0, 85.0, 0.0),

                      child: Row(
                        children: <Widget>[
                          //Text("Connect With Us"),
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child:
                              //Icon(FontAwesomeIcons.facebook,size: 40,),
                              IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.facebook,
                                    size: 40,
                                  ),
                                  onPressed: () => {})),
                          //Icon(FontAwesomeIcons.mailBulk,size: 40,)
                          IconButton(
                              icon: Icon(
                                FontAwesomeIcons.googlePlus,
                                size: 40,
                              ),
                              onPressed: () => {})
                        ],
                      ),
                    ),
                  ),
// rate us portion start  here

                  Material(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                      child: RaisedButton(
                          child: Text("Rate Us",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0)),
                          onPressed: () {}),
                    ),
                  )
                ],
              )),
          body: LayoutStarts(),
        ));
  }
  void logOut()async{

    await FirebaseAuth.instance.signOut();

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LoginPage()));


  }

}

class LayoutStarts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Material(

                    child: InkWell(
                      onTap: (){

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp10()));
                      },

                      child: Container(padding: EdgeInsets.fromLTRB(0, 20.0, 0, 70.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset('images/car.jpg',
                              width: 200.0, height: 150.0),
                        ),),
                    )
                ),
                Material(

                    child: InkWell(
                      onTap: () {
                        showDialog(context: context,
                            builder: (BuildContext context){
                              return AlertDialog(
                                  content: Form(

                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: TextFormField(),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: TextFormField(),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: RaisedButton(
                                                    child: Text("Submitß"),
                                                    onPressed: () {

                                                    }
                                                  //end here
                                                )
                                            )
                                          ]
                                      )
                                  ));
                            });
                      },
                      child: Container(padding: EdgeInsets.fromLTRB(0, 20.0, 0, 70.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset('images/bike.jpg',
                              width: 200.0, height: 150.0),
                        ),),
                    )
                )

              ],
            )
          ],
        ),

        RentButton(),
      ],
    );
  }
}

class RentButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child:
         RaisedButton(
          color: Colors.redAccent,
           padding: EdgeInsets.all(8.0),
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
           child: Column(
               mainAxisSize: MainAxisSize.min,
             children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
               child: Icon(
              Icons.local_hospital,
              color: Colors.white,
                 //size: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              "On Road Emergency",
              style: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
          ),
        ],
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (cotext)=>homepage2()));
      },
    ));
/*    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        width: 200,
        child: FlatButton(
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (cotext)=>homepage2()));},
          child: Text(
            "Rent Car",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                letterSpacing: 1.4,
                fontFamily: "arial"),
          ),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(35)),
          ),
          color: Colors.black,
          padding: EdgeInsets.all(25),
        ),
      ),
    );*/
  }
}

