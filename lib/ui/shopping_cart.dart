import 'package:express/api/express_api.dart';
import 'package:express/drawer.dart';
import 'package:express/modules/cart_product.dart';
import 'package:express/modules/user_m.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  int _radioValue;

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue = value;
    });
  }

  GlobalKey<ScaffoldState> _globalKeyScafoldStateShoping =
      new GlobalKey<ScaffoldState>();
  Future<void> _dialogDelete(int id) async {
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
                  'Are you sure you want to delete it ?',
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
                      deleteProductFromCartApi(id);
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

  void bottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return new Container(
            height: MediaQuery.of(context).size.height / 2,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height / 1.5,
              minHeight: MediaQuery.of(context).size.height / 3,
            ),
            child: bodyUpdatePrice(),
          );
        });
  }

  Widget bodyUpdatePrice(){

    return new Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: new Text(
            'Update Price',
            style: new TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: const Color(0xffA71E26)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16 , bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'Sub Total',
                style: new TextStyle(
                  fontSize: 15.0,

                ),
              ),
              Container(
                width: 16,
              ),
              new Text(
                'Shipping',
                style: new TextStyle(
                  fontSize: 15.0,
                ),
              ),
              Container(
                width: 16,
              ),
              new Text(
                'Total',
                style: new TextStyle(
                  fontSize: 15.0,

                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8 , right: 8),
          child: Container(
              height: 170 ,
              child: listUpdatePrice()),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 8 , right: 8 , top: 16),
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      new Text(
                        'Total',
                        style: new TextStyle(
                          fontSize: 20.0,

                        ),
                      ),

                      new Text(
                        r'200 $',
                        style: new TextStyle(
                          fontSize: 20.0,
                          color:  const Color(0xffA71E26)
                        ),
                      ),
                    ],
                  ),
                ),

                InkWell(
                  child: new Container(
                    height: 60.0,
                    width: MediaQuery.of(context).size.width/2,
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
                                  "BUY NOW",
                                  style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontFamily: 'JF Flat'),
                                )))),
                  ),
                  onTap: () {

                  },
                )
              ],
            ),
          ),
        )

      ],
    );

  }

  Widget listUpdatePrice(){

    return new ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (BuildContext context , int position){
          return listItemUpdatePrice();
        });

  }

  Widget listItemUpdatePrice(){

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new Image.asset("assets/frute5.png" , width: 70, height: 50,),

        new Text(
          r'200 $',
          style: new TextStyle(
            fontSize: 15.0,

          ),
        ),

        new Text(
          r'200 $',
          style: new TextStyle(
            fontSize: 15.0,

          ),
        ),



        new Text(
          r'200 $',
          style: new TextStyle(
            fontSize: 15.0,

          ),
        ),



Radio(
    value: 1,
    groupValue: _radioValue,
    onChanged: _handleRadioValueChange1
)


      ],
    );
  }

  bool errors = false;
  String errorMsg = "";

  deleteProductFromCartApi(int productId) {
    setState(() {
      apiCall = false;
    });
    print("delete cart products");
    new ExpressApi().deleteCartProduct(userM.id, productId).then((response) {
      setState(() {
        apiCall = true;
        errors = false;
      });

      if (response.errors) {
        apiCall = true;
        errorMsg = response.message;
        print("delete error $errorMsg");
        errors = true;
      } else {
        apiCall = true;
        errors = false;

        Navigator.pop(context);
        getAllCartProductsApi();
      }
    }, onError: (error) {
      errors = true;
      Navigator.pop(context);
      getAllCartProductsApi();
      print("delete cart error   : : :: :$error");
    });
  }

  getAllCartProductsApi() {
    setState(() {
      apiCall = false;
    });
    ExpressApi().getAllCartProduct(userM.id).then((response) {
      setState(() {
        this.cartProductsList = response.listCartProducts;
        apiCall = true;
      });
    }, onError: (error) {
      print("get All Product Cart $error");
      setState(() {
        apiCall = true;
      });
    });
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _descrementCounter() {
    setState(() {
      _counter--;
    });
  }

  UserM userM = new UserM();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    UserLocalStorage().getUser().then((user) {
      setState(() {
        this.userM = user;
        print(userM.id);
      });
      getAllCartProductsApi();
    }, onError: () {});
  }

  double RatingShopingCart = 4;
  bool apiCall = false;
  List<CartProducts> cartProductsList = new List();

  Widget customBodyCart() {
    if (apiCall) {
      if (cartProductsList.length == 0) {
        return Center(
          child: Image.asset(
            "assets/empty-box.png",
            width: 150,
            height: 150,
          ),
        );
      } else {
        return new ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: cartProductsList.length,
            itemBuilder: (BuildContext context, int index) {
              return listItemBodyCart(cartProductsList[index]);
            });
      }
    } else {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    }
  }

  Widget listItemBodyCart(CartProducts cartProducts) {
    var cartImage =
        "http://ex-24.com/images/Products/" + cartProducts.img.split(",")[0];

    return new Column(
      children: <Widget>[
        new Container(
          height: MediaQuery.of(context).size.height / 5,
          width: MediaQuery.of(context).size.width,
          child: new Card(
            color: const Color(0xffF4F4F4),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: new Stack(
              children: <Widget>[
                new Positioned(
                    top: 32,
                    left: 110,
                    child: new Image.asset(
                      "assets/like.png",
                      width: 20,
                      height: 20,
                    )),
                new Positioned(
                    top: 0,
                    left: 0,
                    child: new Image.network(
                      cartImage,
                      height: MediaQuery.of(context).size.height / 5,
                      width: 100,
                    )),
                new Positioned(
                  top: 16,
                  left: 140,
                  child: new Text(
                    cartProducts.title,
                    style: new TextStyle(
                        color: const Color(0xffA71E26), fontSize: 18),
                  ),
                ),
                new Positioned(
                  top: 33,
                  left: 140,
                  child: new Row(
                    children: <Widget>[
                      new StarRating(
                        rating: RatingShopingCart,
                        size: 18,
                        color: Colors.orangeAccent,
                        borderColor: Colors.grey,
                        starCount: 5,
                        onRatingChanged: (_rating) => setState(
                              () {
                                this.RatingShopingCart = _rating;
                              },
                            ),
                      )
                    ],
                  ),
                ),
                new Positioned(
                  top: 58,
                  left: 140,
                  child: new Row(
                    children: <Widget>[
                      new Text(
                        cartProducts.price.toString() + r" $",
                        style: new TextStyle(
                            color: Colors.grey[400], fontSize: 18),
                      ),
                      new Container(
                        width: 20,
                      ),
                      new Text(
                        cartProducts.sale_price.toString() + r" $",
                        style: new TextStyle(
                            color: const Color(0xffA71E26), fontSize: 18),
                      ),
                    ],
                  ),
                ),
                new Positioned(
                  top: 83,
                  left: 140,
                  child: InkWell(
                    child: new Container(
                      height: 35.0,
                      width: MediaQuery.of(context).size.width / 4,
                      child: new Material(
                          color: const Color(0xffF4F4F4),
                          elevation: 0.0,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(12.0),
                          ),
                          child: new Center(
                              child: new Padding(
                                  padding: new EdgeInsets.only(
                                      top: 8.0, bottom: 8.0),
                                  child: Row(
                                    children: <Widget>[
                                      new Image.asset(
                                        "assets/rubbish_bin.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      new Container(
                                        width: 8,
                                      ),
                                      new Text(
                                        "Remove",
                                        style: new TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 12.0,
                                            fontFamily: 'JF Flat'),
                                      ),
                                    ],
                                  )))),
                    ),
                    onTap: () {
                      _dialogDelete(cartProducts.id);
                    },
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 83,
                  child: Container(
                    height: 35,
                    width: 80,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: const Color(0xffA71E26),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          InkWell(
                            child: Icon(
                              Icons.indeterminate_check_box,
                              color: Colors.white,
                            ),
                            onTap: () {
                              _descrementCounter();
                            },
                          ),
                          new Text(
                           _counter.toString()
                            ,
                            style: new TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                          InkWell(
                            child: Icon(
                              Icons.add_box,
                              color: Colors.white,
                            ),
                            onTap: () {

                                _incrementCounter();

                            },
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKeyScafoldStateShoping,
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xff606060),
            child: CircleAvatar(
              backgroundColor: Colors.grey[400],
              radius: 10,
              child: Text(
                r"$",
                style: new TextStyle(color: Colors.black),
              ),
            ),
            onPressed: () {
              bottomSheet(context);
            }),
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.menu,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                _globalKeyScafoldStateShoping.currentState.openDrawer();
              }),
          title: Text(
            "Shopping Cart",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          backgroundColor: const Color(0xff363636),
        ),
        drawer: DrawerW().showDrawer(context),
        body: customBodyCart());
  }
}
