import 'package:flutter/material.dart';
import 'cart.dart';
import 'bloc.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
var list = new List(20);
var list2 = new List(20);
var list3= new List(20);

int a=0,total=0;

class MyApp10 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return ChangeNotifierProvider<CartBloc>(
        builder: (context) => CartBloc(),
        child: MaterialApp(
          title: 'Flutter Shopping Cart Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Gift Shop'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
 MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  //MyHomePage(this.user3);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var product_list = [
    {
      "name": "AC PROBLEM",
      "picture": "images/products/AC PROBLEM.png",
      "old_price": 120,
      "price": 1500,
    },
    {
      "name": "CAR BODYWASH",
      "picture": "images/products/CAR BODYWASH.png",
      "old_price": 100,
      "price": 600,
    },
    {
      "name": "CAR CHECKUP",
      "picture": "images/products/CAR CHECKUP.png",
      "old_price": 1000,
      "price": 1000,
    },
    {
      "name": "DENT AND PAINTING",
      "picture": "images/products/DENT AND PAINTING.png",
      "old_price": 1000,
      "price": 4500,
    },
    {
      "name": "ELECTRICAL PROBLEM",
      "picture": "images/products/ELECTRICAL PROBLEM.png",
      "old_price": 1000,
      "price": 1200,
    },
    {
      "name": "ENGINE SERVICING",
      "picture": "images/products/ENGINE SERVICING.png",
      "old_price": 1000,
      "price": 650,
    },
    {
      "name": "ENGINE TUNING",
      "picture": "images/products/ENGINE TUNING.png",
      "old_price": 1000,
      "price": 650,
    },
    {
      "name": "FULL VEHICLE PAINTING",
      "picture": "images/products/FULL VEHICLE PAINTING.png",
      "old_price": 1000,
      "price": 0,
    },
    {
      "name": "FULLWASH AND POLISH",
      "picture": "images/products/FULLWASH AND POLISH.png",
      "old_price": 1000,
      "price": 4500,
    },
    {
      "name": "HOME GARAGE SERVICE",
      "picture": "images/products/HOME GARAGE SERVICE.png",
      "old_price": 1000,
      "price": 700,
    },
    {
      "name": "INTERIOR WASH",
      "picture": "images/products/INTERIOR WASH.png",
      "old_price": 1000,
      "price": 1000,
    },
    {
      "name": "ON ROAD SERVICE",
      "picture": "images/products/ON ROAD SERVICE.png",
      "old_price": 1000,
      "price": 1000,
    },
    {
      "name": "POLISH",
      "picture": "images/products/POLISH.png",
      "old_price": 1000,
      "price": 3000,
    },
    {
      "name": "SCRATCH",
      "picture": "images/products/SCRATCH.png",
      "old_price": 1000,
      "price": 1000,
    },
    {
      "name": "START PROBLEM",
      "picture": "images/products/START PROBLEM.png",
      "old_price": 1000,
      "price": 0,
    },
    {
      "name": "VEHICLE REPAIR SERVICES",
      "picture": "images/products/VEHICLE REPAIR SERVICES.png",
      "old_price": 1000,
      "price": 0,
    },
  ];
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    int totalCount = 0;
    if (bloc.cart.length > 0) {
      totalCount = bloc.cart.values.reduce((a, b) => a + b);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Container(
                height: 150.0,
                width: 30.0,
                child: new GestureDetector(
                  onTap: ()
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage(),
                      ),
                    );
                  },
                  child: new Stack(
                    children: <Widget>[
                      new IconButton(
                        icon: new Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      ),
                      new Positioned(
                          child: new Stack(
                            children: <Widget>[
                              new Icon(Icons.brightness_1,
                                  size: 20.0, color: Colors.red[700]),
                              new Positioned(
                                  top: 3.0,
                                  right: 7,
                                  child: new Center(
                                    child: new Text(
                                      '$totalCount',
                                      style: new TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            ],
                          )),
                    ],
                  ),
                )),
          )
        ],
      ),
      body:  Stack(

          children: <Widget>[
            GridView.builder(

                itemCount: product_list.length,
                gridDelegate:
                new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return Single_prod(
                    prod_name: product_list[index]['name'],
                    prod_picture: product_list[index]['picture'],
                    prod_old_price: product_list[index]['old_price'],
                    prod_price: product_list[index]['price'],
                  );
                }

            ),

          /*  Card(

              child: Hero(
                 // tag: prod_name,
                  tag: "gh",
                  child: Material(
                    child: InkWell(onTap: (){
                      //map['b']=['b'];
                      // print(map);
                      //_snackbar();
                     /// a++;
                     // list[a]=prod_name;
                     // list2[a]=prod_price;

                      //+" "+prod_price as String
                      // dls[prod_name] = prod_price;

                      //print(list[a]);
                    },
                      child: GridTile(
                        footer: Container(
                          color: Colors.white70  ,
                          child: ListTile(
                            leading: Text(
                             // prod_name,
                              "gfg",
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                           // title:Text("\$$prod_price",style: new TextStyle(
                              title:Text("hgfh",style: new TextStyle(
                              color: Colors.red,
                              fontSize: 30,
                              // decoration: TextDecoration.lineThrough,
                            )
                            ),
                          ),
                        ),
                        child: Image.asset("images/products/icon_1.png",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),

                  )
              ),

            ),*/

          ]

    )
       /*GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index) {

         return GestureDetector(
              onTap: () {
                bloc.addToCart(index);
              },

              child: Container(
                child: ListTile(
              leading: Text("jfgh")
                ),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/products/icon_1.png"),
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ));
        }),
      ),*/
    );
  }
}

class Single_prod extends StatelessWidget {

  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod(

      {this.prod_name,
        this.prod_picture,
        this.prod_old_price,
        this.prod_price});

  @override
  Widget build(BuildContext context) {

    var bloc = Provider.of<CartBloc>(context);
    int totalCount = 0;
    if (bloc.cart.length > 0) {
      totalCount = bloc.cart.values.reduce((a, b) => a + b);
    }

    _snackbar(){

      final snackBar = SnackBar(
        content: Text('Service Added to Cart'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            // Some code to undo the change.

          },
        ),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    };
    return Stack(
        children: <Widget>[

          Card(
            child: Hero(
                tag: prod_name,
                child: Material(
                  child: InkWell(onTap: (){
                    //map['b']=['b'];
                    // print(map);
                    _snackbar();

                    list[a]=prod_name;
                    list2[a]=prod_price;
                    list3[a]=prod_picture;
                    total=total+prod_price;
                    bloc.addToCart(a);
                    //+" "+prod_price as String
                    // dls[prod_name] = prod_price;

                    //print(list[a]);
                    a++;
                  },
                    child: GridTile(
                      
                      footer: Container(

                        color: Colors.white70  ,
                        child: ListTile(
                          title: Text(
                            prod_name,
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          subtitle:Text("$prod_price"+"\t"+"BDT",style: new TextStyle(
                            color: Colors.red,
                            fontSize: 30,
                            // decoration: TextDecoration.lineThrough,
                          )
                          ),
                        ),
                      ),
                      child: Image.asset(prod_picture,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                )
            ),

          ),

        ]


    );


  }

  lisiP(){

    //print(map);

  }


}