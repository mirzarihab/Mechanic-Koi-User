import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:launch_review/launch_review.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app3/signin.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';

class homepage extends StatefulWidget {

  homepage();

  @override


  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  // GoogleMapController mapController;
  Completer<GoogleMapController> _controller1 = Completer();
  final LatLng _center = const LatLng(23.8103, 90.4125);

  /** void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
      } **/



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

  /**@override
      void initState() {
      // TODO: implement initState
      super.initState();
      }**/


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
                icon:
                Icon(Icons.notifications),
                onPressed: () {
                  PopupMenuItem(
                    value: 1,
                    child: Text("First"),
                  );
                  PopupMenuItem(
                    value: 2,
                    child: Text("Second"),
                  );
                }

            )
          ],

        ),

        drawer: Drawer(
            child: ListView(

              children: <Widget>[
                DrawerHeader(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: <Color>[
                          Colors.indigo,
                          Colors.blueAccent
                        ])
                    ),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Material(
                            borderRadius: BorderRadius.all(
                                Radius.circular(50.0)),
                            elevation: 10,

                            child: Padding(padding: EdgeInsets.all(8.0),
                              child: Image.asset('images/splashicon.png',
                                width: 80, height: 80,),),
                          ),
                          Text("Mirza Rihab", style: TextStyle(
                              color: Colors.white, fontSize: 20.0),),
                          Text('ontest', style: TextStyle(
                              color: Colors.white, fontSize: 15.0),)
                        ],
                      ),
                    )),
                CustomListTile(Icons.person, "Profile", () => {}),
                //CustomListTile(Icons.notifications,"Notification",()=>{}),
                CustomListTile(FontAwesomeIcons.medal, "Meadls", () => {}),
                CustomListTile(Icons.library_books, "History", () => {}),
                CustomListTile(Icons.credit_card, "Payment", () => {}),
                CustomListTile(Icons.settings, "Settings", () => {}),
                CustomListTile(Icons.exit_to_app, "LogOut", () => {}),

                //footer section
                Material(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 25.0, 0.0, 0.0),
                    child: Center(
                      child: Text("Connect With Us",
                        style: TextStyle(fontSize: 18.0, color: Colors.blue),),
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
                                icon: Icon(FontAwesomeIcons.facebook,
                                  size: 40,),

                                onPressed: _launchURL1

                            )


                        ),
                        //Icon(FontAwesomeIcons.mailBulk,size: 40,)
                        IconButton(
                            icon: Icon(FontAwesomeIcons.googlePlus, size: 40,),

                            onPressed: _launchURL2

                        )
                      ],
                    ),
                  ),
                ),
// rate us portion start  here

                Material(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                    child: RaisedButton(
                        child: Text("Rate Us", style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)),
                        onPressed: () {
                          LaunchReview.launch(
                              androidAppId: "com.mechanickoi.mechanic_test",
                              iOSAppId: ""
                          );
                        }),
                  ),
                )

              ],


            )
        ),
        //body start

        body: Stack(
          children: <Widget>[

            GoogleMap(
              //onMapCreated: _onMapCreated,
              onMapCreated: (GoogleMapController controller) {
                _controller1.complete(controller);
              },

              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,

              ),

              minMaxZoomPreference: MinMaxZoomPreference(10, 15),
              myLocationButtonEnabled: true,
              zoomGesturesEnabled: true,
              scrollGesturesEnabled: true,
              tiltGesturesEnabled: true,
              rotateGesturesEnabled: true,
              compassEnabled: true,


              markers: {
                myLocation,
              },

            ),

            /**  FloatingActionButton.extended(
                onPressed: _currentLocation,

                label: Text('My Location'),
                icon: Icon(Icons.location_on),
                ),**/
            Positioned(
              bottom: 10,
              right: 10,
              child:  FloatingActionButton(

                child: Icon(Icons.my_location),
                onPressed: _currentLocation,
                // label: Text('My Location'),
              ),
            ),




            Positioned(
              top: 30.0,
              right: 15.0,
              left: 15.0,
              child: Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1.0, 5.0),
                        blurRadius: 10,
                        spreadRadius: 3)
                  ],
                ),
                child: TextField(
                  cursorColor: Colors.black,
                  // controller: appState.locationController,
                  decoration: InputDecoration(
                    icon: Container(
                      margin: EdgeInsets.only(left: 20, top: 5),
                      width: 10,
                      height: 10,
                      child: Icon(
                        Icons.location_on,
                        color: Colors.black,
                      ),
                    ),
                    hintText: "Your Location",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15.0, top: 16.0),
                  ),
                ),
              ),
            ),

            SizedBox(height: 100.0,),

          ],


        ),
      ),
    );



  }


  Marker myLocation = Marker(

      markerId: MarkerId('1stmarker'),
      position: LatLng(19.0760, 72.8777),
      // infoWindow: InfoWindow(title: ''),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)

  );


//body end
//for icon
  _launchURL1() async {
    const url = 'https://facebook.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL2() async {
    const url = 'https://google.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  void _currentLocation() async {
    final GoogleMapController controller = await _controller1.future;
    LocationData currentLocation;
    var location = new Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = null;
    }

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 17.0,
      ),
    ));


  }


}
//icon end



//coustom code for sidebar widget
class CustomListTile extends StatelessWidget {

  IconData icon;
  String text;
  Function onTap;
  CustomListTile(this.icon,this.text,this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))
        ),
        child: InkWell(
          splashColor: Colors.indigo,
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(icon),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(text,style: TextStyle(
                          fontSize: 18.0
                      ),),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

