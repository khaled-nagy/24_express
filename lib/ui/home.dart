import 'package:flutter/material.dart';
import 'package:express/ui/create_acount.dart';
import 'package:express/ui/sign_in.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(

        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("assets/background.jpeg"), fit: BoxFit.cover),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 32, right: 32),
          child: new Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image.asset(
                    "assets/icone.jpeg",
                    width: 150,
                    height: 150,
                  ),
                ],
              ),
              new Container(
                height: 40,
              ),
                 InkWell(
                  child: new Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width/1.5,
                    child: new Material(
                        color: const Color(0xffA71E26),
                        elevation: 0.0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(12.0),
                            side: BorderSide(color: Colors.white, width: 2.0)),
                        child: new Center(
                            child: new Padding(
                                padding:
                                    new EdgeInsets.only(top: 8.0, bottom: 8.0),
                                child: new Text(
                                  "CREATE ACCOUNT",
                                  style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontFamily: 'JF Flat'),
                                )))),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>new CreateAccount()));
                  },
                ),
              new Container(
                height: 20,
              ),

                 InkWell(
                   child: new Container(
                     height: 50.0,
                     width: MediaQuery.of(context).size.width/1.5,
                     child: new Material(
                         color: const Color(0xffA71E26),
                         elevation: 0.0,
                         shape: new RoundedRectangleBorder(
                             borderRadius: new BorderRadius.circular(12.0),
                             side: BorderSide(color: Colors.white, width: 2.0)),
                         child: new Center(
                             child: new Padding(
                                 padding:
                                 new EdgeInsets.only(top: 8.0, bottom: 8.0),
                                 child: new Text(
                                   "SIGN IN",
                                   style: new TextStyle(
                                       color: Colors.white,
                                       fontSize: 15.0,
                                       fontFamily: 'JF Flat'),
                                 )))),
                   ),
                   onTap: () {
                     Navigator.push(context, MaterialPageRoute(
                         builder: (context)=>new SignIn()));
                   },
                 ),

            ],
          ),
        ),
      ),
    );
  }
}
