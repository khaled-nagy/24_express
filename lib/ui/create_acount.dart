import 'package:express/modules/user_m.dart';
import 'package:flutter/material.dart';
import 'package:express/api/express_api.dart';
import 'package:express/bottom_navigation.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final formKey = GlobalKey<FormState>();
  final mainKey = GlobalKey<ScaffoldState>();

  bool apiCall = true;
  String errorMsg = "";
  bool error = false;

  UserM  user = new UserM() ;


  TextEditingController _nameController = new TextEditingController();
  TextEditingController _lastNameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPasswordController =
      new TextEditingController();
  Widget showErrorMsg(){
    if  (error){
      return Text(
        errorMsg
        ,
        style: new TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold ,
        ),
      );
    }else {
      return Text(
        errorMsg
        ,
        style: new TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold ,
        ),
      );
    }
  }

  register() {
    var form = formKey.currentState;

    if (form.validate()) {
      new ExpressApi().Register(
        _nameController.text,
        _lastNameController.text,
        _emailController.text,
        _passwordController.text,
      )
          .then((response) {
        if (response.error) {
          print("errorMsg  :  :  : " + response.message);
          setState(() {
            errorMsg = response.message;
            apiCall = true;
          });
        } else {
          print("done   :  : register : ");
          setState(() {
            apiCall = false;
          });
          UserM  user = new UserM() ;

          user.password = _passwordController.text;
          UserLocalStorage local = new UserLocalStorage();
          local.saveUser(user).then((response) {
            if (response) {

              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => new BottomNavigation()));
            }
          }, onError: (error) {
            print("local Error ***********************");
            print(error);
          });
        }
      }, onError: (error) {
        print("request error : : :  $error");
        setState(() {
          apiCall = true;
        });
      });
    }else
    setState(() {
      form.save();
      apiCall= true ;
    });
  }

  Widget RgisterBtn() {
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
              ),
              child: new Center(
                  child: new Padding(
                      padding: new EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: new Text(
                        "CREATE ACCOUT",
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontFamily: 'JF Flat'),
                      )))),
        ),
        onTap: () {
          print("register BTN  tabed ");
          setState(() {
            apiCall = false;
          });
          register();

//          Navigator.pushReplacement(context, MaterialPageRoute(
//              builder: (context) => new BottomNavigation()));
        },
      );
    } else {
      return new Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: CircularProgressIndicator());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: mainKey,
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
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
            child: Form(
              key: formKey,
              child: new Column(
                children: <Widget>[
                  new Center(
                    child: new Text(
                      "Create Account",
                      style: new TextStyle(
                          color: const Color(0xffA71E26), fontSize: 24),
                    ),
                  ),
                  new Container(
                    height: 50,
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2.3,
                        child: new Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          color: const Color(0xffFBF7F6),
                          child: new TextFormField(
                            validator: (strFirst) {
                              if (strFirst.isEmpty) {
                                return "empty value";
                              } else if (strFirst.length <= 2) {
                                return " to short!";
                              }
                            },
                            onSaved: (strFirst) =>
                                _nameController.text = strFirst,
                            controller: _nameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  right: 16.0, top: 8.0, left: 16),
                              hintText: "First Name",
                              labelStyle: new TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      new Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2.3,
                        child: new Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          color: const Color(0xffFBF7F6),
                          child: new TextFormField(
                            validator: (strLast) {
                              if (strLast.isEmpty) {
                                return "empty value";
                              } else if (strLast.length <= 2) {
                                return " to short!";
                              }
                            },
                            onSaved: (strLast) =>
                                _lastNameController.text = strLast,
                            controller: _lastNameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  right: 16.0, top: 8.0, left: 16),
                              hintText: "Last Name ",
                              labelStyle:
                                  new TextStyle(color: Colors.grey[400]),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  new Container(
                    height: 20,
                  ),
                  new Container(
                    height: 50,
                    child: new Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      color: const Color(0xffFBF7F6),
                      child: new TextFormField(
                        validator: (strEmail) {
                          if (strEmail.isEmpty) {
                            return "empty value";
                          } else if (strEmail.length <= 2) {
                            return " to short!";
                          } else if (!strEmail.contains("@")) {
                            return "Not a Valid Username!";
                          }
                        },
                        onSaved: (strEmail) => _emailController.text = strEmail,
                        controller: _emailController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(right: 16.0, top: 8.0, left: 16),
                          hintText: "Email",
                          labelStyle: new TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                    ),
                  ),
                  new Container(
                    height: 20,
                  ),
                  showErrorMsg(),
                  new Container(
                    height: 50,
                    child: new Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      color: const Color(0xffFBF7F6),
                      child: new TextFormField(
                        validator: (strPassword) {
                          if (strPassword.isEmpty) {
                            return "empty value";
                          } else if (strPassword.length <= 6) {
                            return " Must not be less than letters!";
                          }
                        },
                        onSaved: (strPassword) =>
                            _passwordController.text = strPassword,
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(right: 16.0, top: 8.0, left: 16),
                          hintText: "Password",
                          labelStyle: new TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                    ),
                  ),
                  new Container(
                    height: 20,
                  ),
                  new Container(
                    height: 50,
                    child: new Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      color: const Color(0xffFBF7F6),
                      child: new TextFormField(
                        validator: (strCPassword) {
                          if (strCPassword.isEmpty) {
                            return "empty value";
                          } else if (strCPassword.length <= 6) {
                            return " Must not be less than letters!";
                          } else if (_passwordController ==
                              _confirmPasswordController) {
                            return " password not eqwal to confirm pass";
                          }
                        },
                        onSaved: (strCPassword) =>
                            _passwordController.text = strCPassword,
                        controller: _confirmPasswordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(right: 16.0, top: 8.0, left: 16),
                          hintText: "Confirm Password ",
                          labelStyle: new TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                    ),
                  ),
                  new Container(
                    height: 70,
                  ),
                  RgisterBtn(),

                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          "OR",
                          style: new TextStyle(fontSize: 24),
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
                          ),
                          child: new Center(
                              child: new Padding(
                                  padding: new EdgeInsets.only(
                                      top: 8.0, bottom: 8.0),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
