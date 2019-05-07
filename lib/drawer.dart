import 'package:express/modules/user_m.dart';
import 'package:express/ui/home.dart';
import 'package:flutter/material.dart';
class DrawerW {

  Future<void> _dialogLogOut(BuildContext context) async {
    // check if 0 skill , 1 history , 2 education
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Are you sure you want to sign out ?',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: InkWell(
                    child: new Container(
                      width: MediaQuery.of(context).size.width / 2.8,
                      child: new Material(
                          color: const Color(0xffA71E26),
                          elevation: 0.0,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                              side:
                              BorderSide(color: Colors.white, width: 2.0)),
                          child: new Center(
                              child: new Padding(
                                  padding: new EdgeInsets.only(
                                      top: 8.0, bottom: 8.0),
                                  child: new Text(
                                    "Yas",
                                    style: new TextStyle(
                                        color: Colors.white, fontSize: 15.0),
                                  )))),
                    ),
                    onTap: () {
                      UserLocalStorage().clear();
                      Navigator.pushReplacement(context,new MaterialPageRoute(
                          builder: (BuildContext context) => new Home()));


                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: InkWell(
                    child: new Container(
                      width: MediaQuery.of(context).size.width / 2.8,
                      child: new Material(
                          color: const Color(0xffA71E26),
                          elevation: 0.0,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                              side:
                              BorderSide(color: Colors.white, width: 2.0)),
                          child: new Center(
                              child: new Padding(
                                  padding: new EdgeInsets.only(
                                      top: 8.0, bottom: 8.0),
                                  child: new Text(
                                    "Cancel",
                                    style: new TextStyle(
                                        color: Colors.white, fontSize: 15.0),
                                  )))),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
  Widget showDrawer(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width / 1.7,
        child: new Container(
          decoration: BoxDecoration(color: const Color(0xff15212F)),
          child: new ListView(
            children: <Widget>[
              Container(height: 16,),
              new ListTile(
                title: new Text(
                  "Home",
                  style: new TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey[50],
                      fontFamily: 'JF Flat'),
                ),
                leading: new Image.asset("assets/home.png", height: 30.0,
                  width: 30.0,) ,

                onTap: () {
Navigator.pop(context);
                }, //الرئيسيه
              ),
              new Container(
                color: Colors.black.withOpacity(0.3),
                height: 1.0,
              ),

              Container(height: 16,),
              new ListTile(
                title: new Text(
                  "Today Deals",
                  style: new TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey[50],
                      fontFamily: 'JF Flat'),
                ),

                leading: new Image.asset(
                  "assets/percentage.png",
                  height: 30.0,
                  width: 30.0,
                ),

                onTap: () {
                  Navigator.pop(context);
                }, //الملف الشخصى
              ),
              new Container(
                color: Colors.black.withOpacity(0.3),
                height: 1.0,
              ),
              Container(height: 16,),
              new ListTile(
                title: new Text(
                  "Category",
                  style: new TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey[50],
                      fontFamily: 'JF Flat'),
                ),
                leading: new Image.asset(
                  "assets/shopping-basket.png",
                  height: 30.0,
                  width: 30.0,
                ),

                onTap: () {
                  Navigator.pop(context);
                }, //الرئيسيه
              ),
              new Container(
                color: Colors.black.withOpacity(0.3),
                height: 1.0,
              ),
              Container(height: 16,),
              new ListTile(
                title: new Text(
                  "My Order ",
                  style: new TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey[50],
                      fontFamily: 'JF Flat'),
                ),
                leading: new Image.asset(
                  "assets/shopping-cart.png",
                  height: 30.0,
                  width: 30.0,
                ),

                onTap: () {
                  Navigator.pop(context);
                }, //الرئيسيه
              ),
              new Container(
                color: Colors.black.withOpacity(0.3),
                height: 1.0,
              ),
              Container(height: 16,),

              new ListTile(
                title: new Text(
                  "Wish List",
                  style: new TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey[50],
                      fontFamily: 'JF Flat'),
                ),
                leading: new Image.asset(
                  "assets/like.png",
                  height: 30.0,
                  width: 30.0,
                ),

                onTap: () {
                  Navigator.pop(context);
                }, // الاعدادات
              ),
              new Container(
                height:30.0,
              ),

              Container(height: 16,),
              new ListTile(
                title: new Text(
                  "Language",
                  style: new TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey[50],
                      fontFamily: 'JF Flat'),
                ),
                leading: new Image.asset(
                  "assets/worlwide.png",
                  width: 30.0,
                  height: 30.0,
                ),

                onTap: () {

                  Navigator.pop(context);
                }, //الرئيسيه
              ),




              new ListTile(
                title: new Text(
                  "Logout",
                  style: new TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey[50],
                      fontFamily: 'JF Flat'),
                ),
                leading: new Image.asset(
                  "assets/logout.png",
                  height: 30.0,
                  width: 30.0,
                ),

                onTap: () {
                  Navigator.pop(context);
                  _dialogLogOut(context);
                }, // الاعدادات
              ),
            ],
          ),
        ),

    );
  }
}