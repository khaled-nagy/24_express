import 'package:express/api/express_api.dart';
import 'package:flutter/material.dart';
import 'package:express/ui/main_home.dart';
import 'package:express/bottom_navigation.dart';
import 'package:express/modules/user_m.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Widget showErrorMsg() {
    if (error) {
      return Text(
        errorMsg,
        style: new TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return Text(
        errorMsg,
        style: new TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  bool apiCall = true;
  bool error = false;
  String errorMsg = "";
  Widget logInButton() {
    if (apiCall) {
      return InkWell(
        child: new Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width,
          child: new Material(
              color: const Color(0xffA71E26),
              elevation: 0.0,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(12.0),
                  side: BorderSide(color: Colors.white, width: 2.0)),
              child: new Center(
                  child: new Padding(
                      padding: new EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: new Text(
                        "SIGN IN",
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontFamily: 'JF Flat'),
                      )))),
        ),
        onTap: () {
          setState(() {
            apiCall = false;
          });

          logIn();
        },
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget logIn() {
    new ExpressApi()
        .LogIn(_usernameController.text, _passwordController.text)
        .then((response) {

      if (response.error) {
        setState(() {
          error = true;
          errorMsg = "من فضلك افحص البريد الالكترونى او كلمة المرور";
          apiCall = true;
        });
      } else {
        print("user login #############");
        UserM user = response.user;
        user.email = _usernameController.text;
        user.password = _passwordController.text;

        new UserLocalStorage().saveUser(user).then((done) {
          if (done) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => new BottomNavigation()));
          }
        }, onError: (error) {
          setState(() {
            apiCall = true;
          });
          print("save user error  :  :  : $error");
        });
      }
    }, onError: (error) {
      print("Server errors   :  :   : $error");
      setState(() {
        apiCall = true;
        errorMsg = "there is some server errors please try again later ";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: new Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("assets/background.jpeg"),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 32, right: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Text(
                  "SIGN IN",
                  style: new TextStyle(
                      color: const Color(0xffA71E26), fontSize: 24),
                ),
                new Container(
                  height: 50,
                ),
                new Container(
                  height: 50,
                  child: new Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    color: const Color(0xffFBF7F6),
                    child: new TextField(
                      controller: _usernameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.only(right: 16.0, top: 8.0, left: 16),
                        hintText: "username",
                        labelStyle: new TextStyle(color: Colors.grey[400]),
                      ),
                    ),
                  ),
                ),
                new Container(
                  height: 50,
                ),
                new Container(
                  height: 50,
                  child: new Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    color: const Color(0xffFBF7F6),
                    child: new TextField(
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.only(right: 16.0, top: 8.0, left: 16),
                        hintText: "password",
                        labelStyle: new TextStyle(color: Colors.grey[400]),
                      ),
                    ),
                  ),
                ),
                new Container(
                  height: 50,
                ),
                logInButton(),
                showErrorMsg(),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: new Row(
                    children: <Widget>[
                      new Text(
                        "Forgot Password",
                        style: new TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
                InkWell(
                  child: new Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    child: new Material(
                        color: const Color(0xff3B579D),
                        elevation: 0.0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(12.0),
                            side: BorderSide(color: Colors.white, width: 2.0)),
                        child: new Center(
                            child: new Padding(
                                padding:
                                    new EdgeInsets.only(top: 8.0, bottom: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Image.asset(
                                      "assets/face.png",
                                      width: 40,
                                      height: 40,
                                    ),
                                    new Text(
                                      "FACE BOOK",
                                      style: new TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          fontFamily: 'JF Flat'),
                                    ),
                                  ],
                                )))),
                  ),
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
