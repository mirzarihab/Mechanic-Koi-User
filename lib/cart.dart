import 'package:flutter/material.dart';
import 'package:flutter_app3/homepage.dart';
import 'bloc.dart';
import 'package:provider/provider.dart';
import 'maincart.dart';
import 'mapPage.dart';
import 'signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
var d,c,p,x;
var ser="";
var user;
Map <dynamic, dynamic> _userdata ;
class CartPage extends StatelessWidget {
  final databaseReference = Firestore.instance;
  final FirebaseMessaging _messaging = FirebaseMessaging();

 CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    recordData();
    var bloc = Provider.of<CartBloc>(context);
    var cart = bloc.cart;
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
      ),
      body: Column(
        children: <Widget>[

          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, a) {
                  int giftIndex = cart.keys.toList()[a];
                  print(giftIndex);
                  int count = cart[giftIndex];
                  d= list[a];
                  c=list3[a];
                  p=list2[a];
                  ser= list[a]+"\n"+ser;

                  return ListTile(
                    leading: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('$c'),
                          fit: BoxFit.fitWidth,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    title: Text(' $d' ),
                    subtitle: Text("$p"+"BDT",style: new TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      // decoration: TextDecoration.lineThrough,
                    )),
                    trailing: RaisedButton(
                      child: Text('Clear',style: TextStyle(color: Colors.white),),
                      color: Colors.red,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                      elevation: 1.0,
                      splashColor: Colors.blueGrey,
                      onPressed: () {
                        bloc.clear(giftIndex);
                      },
                    ),

                  );
                },

              ),
            ),
          ),
         // Text("$ser"),
           Text("$total"+ "\t"+"BDT",style:  TextStyle(fontSize: 30,color: Colors.red),),

          RaisedButton(
            color: Colors.lightBlue,
            textColor: Colors.white,
            padding: EdgeInsets.all(25.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),


            onPressed: (){
            //recordData();
            Navigator.push( context,
                MaterialPageRoute(builder: (context) => homepage2()));
          },
            child: Text("Proceed To Services",style: TextStyle(fontSize: 20),),
          )

        ],
      ),

    );


  }
  recordData()async{
    user = await FirebaseAuth.instance.currentUser();

    Firestore.instance
        .collection('User Data')
        .document(user.uid)
        .get()
        .then((DocumentSnapshot ds) {
      // use ds as a snapshot
      _userdata = ds.data;
      print(_userdata['Name']);
      //noti=map2['Name'];
      // print(map2);

      // propage(map2);
      //clPro();
    }


    );

    await databaseReference.collection("Services")
        .document(user.uid)
        .setData({

      'Services':  ser,
      'User Name': _userdata['Name'],
      'Car Name & Model':  _userdata['Car Name & Model'],
      'Total price': total,

    });



  }
}