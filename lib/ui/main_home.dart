import 'package:express/api/express_api.dart';
import 'package:express/bottom_navigation.dart';
import 'package:express/modules/cart_product.dart';
import 'package:express/modules/count.dart';
import 'package:express/modules/get_category_most_view.dart';
import 'package:express/modules/products.dart';
import 'package:express/modules/user_m.dart';
import 'package:express/ui/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'dart:convert';
import 'package:express/bottom_navigation.dart';

class MainHome extends StatefulWidget {


  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {

  List<CartProducts> addCartList = new List();

  UserM userM = new UserM();
  Products products;

  bool error = true;
  String errorMsg = "";

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

  addToCartApi(int id) {
    setState(() {
      apiCall = false;
    });

    new ExpressApi().getAddToCart(userM.id, id).then((response) {
      setState(() {
        apiCall = true;
      });

      if (response.errors) {
        setState(() {
          error = true;
          errorMsg = response.message;
          apiCall = false;
        });
      } else {
        setState(() {
          addCartList = response.cartList;
        });
      }
    }, onError: (error) {
      setState(() {
        apiCall = true;
      });
      print("add To Cart error :: :: :: $error");
    });
  }

  double seleListRating = 3.5;
  double listProductRating = 2.5;
  bool apiCall = true;
  List<GetCategoryMostView> GetCategoryMostViewList = new List();
  List<Products> productsList = new List();

  void GetCategoryMostViewApi() {
    setState(() {
      apiCall = true;
    });
    new ExpressApi().GetCategoryMostView().then((response) {
      setState(() {
        this.GetCategoryMostViewList = response.getCategoryMostView;
        apiCall = false;
      });
    }, onError: (error) {
      print("category error $error");
      setState(() {
        apiCall = false;
      });
    });
  }

  void getProductsApi() {
    setState(() {
      apiCall = true;
    });
    new ExpressApi().getProducts().then((response) {
      setState(() {
        this.productsList = response.productsList1;
        apiCall = false;
      });
    }, onError: (error) {
      print("category error $error");
      setState(() {
        apiCall = false;
      });
    });
  }

  @override
  void initState() {
    UserLocalStorage().getUser().then((user) {
      setState(() {
        this.userM = user;
        print(userM.id);
      });
    }, onError: () {});
    GetCategoryMostViewApi();
    getProductsApi();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget allCategoryList() {
    return new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: GetCategoryMostViewList.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return listItemallCategory(GetCategoryMostViewList[index]);
        });
  }

  Widget listItemallCategory(GetCategoryMostView mostView) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 70,
        height: 100,
        child: new Column(
          children: <Widget>[
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(
                  "http://ex-24.com/images/Category/" + mostView.img),
            ),
            new Container(
              height: 8,
            ),
            new Text(
              mostView.title,
              style: new TextStyle(
                fontSize: 8,
              ),
            )
          ],
        ),
      ),
    );
  }

  percentage(Products products) {
    double Multiplication = products.price * 100;
    double resulut = Multiplication / products.sale_price;
    return resulut.toString();
  }

  Widget saleList() {
    return new ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: productsList.length,
        physics: ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return listItemSale(productsList[index]);
        });
  }

  Widget listItemSale(Products products) {
    var saleImage =
        "http://ex-24.com/images/Products/" + products.img.split(",")[0];
    print(saleImage);

    return new Container(
      height: MediaQuery.of(context).size.height / 2.8,
      width: MediaQuery.of(context).size.width / 2.2,
      child: new Column(
        children: <Widget>[
          new Text(
            "Super Sale",
            style: new TextStyle(color: const Color(0xffA71E26), fontSize: 24),
          ),
          InkWell(
            child: new Container(
              height: MediaQuery.of(context).size.height / 3.2,
              width: MediaQuery.of(context).size.width,
              child: new Card(
                color: const Color(0xffF4F4F4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: new Stack(
                  children: <Widget>[
                    new Positioned(
                        top: 8,
                        right: 8,
                        child: new Image.asset(
                          "assets/like.png",
                          width: 20,
                          height: 20,
                        )),
                    new Positioned(
                      right: 8,
                      bottom: 60,
                      child: new Text(
                        percentage(products) + "%",
                        style: new TextStyle(
                            color: const Color(0xffA71E26), fontSize: 15),
                      ),
                    ),
                    new Positioned(
                        top: 8,
                        left: 16,
                        child: new Image.network(
                          saleImage,
                          width: 80,
                          height: 100,
                        )),
                    new Positioned(
                      bottom: 80,
                      left: 8,
                      child: new Text(
                        products.title,
                        style: new TextStyle(
                            color: const Color(0xffA71E26), fontSize: 10),
                      ),
                    ),
                    new Positioned(
                      bottom: 60,
                      left: 8,
                      child: new Row(
                        children: <Widget>[
                          new StarRating(
                            rating: seleListRating,
                            size: 15,
                            color: Colors.orangeAccent,
                            borderColor: Colors.grey,
                            starCount: 5,
                            onRatingChanged: (_rating) => setState(
                                  () {
                                    this.seleListRating = _rating;
                                  },
                                ),
                          )
                        ],
                      ),
                    ),
                    new Positioned(
                      bottom: 40,
                      left: 8,
                      child: new Row(
                        children: <Widget>[
                          new Text(
                            products.price.toString() + r" $",
                            style: new TextStyle(
                                color: Colors.grey[400], fontSize: 15),
                          ),
                          new Container(
                            width: 20,
                          ),
                          new Text(
                            products.sale_price.toString() + r" $",
                            style: new TextStyle(
                                color: const Color(0xffA71E26), fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    new Positioned(
                      bottom: 10,
                      left: 8,
                      child: InkWell(
                        child: new Container(
                          height: 30.0,
                          width: MediaQuery.of(context).size.width / 4,
                          child: new Material(
                              color: const Color(0xffA71E26),
                              elevation: 0.0,
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(12.0),
                                  side: BorderSide(
                                      color: Colors.white, width: 2.0)),
                              child: new Center(
                                  child: new Padding(
                                      padding: new EdgeInsets.only(
                                          top: 8.0, bottom: 8.0),
                                      child: Row(
                                        children: <Widget>[
                                          new Container(
                                            width: 4,
                                          ),
                                          new Image.asset(
                                            "assets/shopping-cart-of-checkered-design.png",
                                            width: 20,
                                            height: 20,
                                          ),
                                          new Container(
                                            width: 8,
                                          ),
                                          new Text(
                                            "ADD TO CART",
                                            style: new TextStyle(
                                                color: Colors.white,
                                                fontSize: 8.0,
                                                fontFamily: 'JF Flat'),
                                          ),
                                        ],
                                      )))),
                        ),
                        onTap: () {

                          if (!error) {
                            setState(() {
                              error = true;
                            });
                            Scaffold.of(context).showSnackBar(new SnackBar(
                                content: showErrorMsg()));
                          } else {
                            setState(() {
                              error = false;
                            });
                            addToCartApi(products.id);



                          }


                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new ProductDetails(products.id)));
            },
          )
        ],
      ),
    );
  }

  Widget listProduct() {
    final double itemHeight =
        (MediaQuery.of(context).size.height - kToolbarHeight - 24) / 2.4;
    final double itemWidth = MediaQuery.of(context).size.width / 2;
    return new GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1.0,
          childAspectRatio: (itemWidth / itemHeight),
          mainAxisSpacing: 1.0),
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: 4,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return new Container(
          height: MediaQuery.of(context).size.height / 2.8,
          width: MediaQuery.of(context).size.width / 2.2,
          child: new Column(
            children: <Widget>[
              new Text(
                "Super Sale",
                style:
                    new TextStyle(color: const Color(0xffA71E26), fontSize: 24),
              ),
              new Container(
                height: MediaQuery.of(context).size.height / 3.2,
                width: MediaQuery.of(context).size.width,
                child: new Card(
                  color: const Color(0xffF4F4F4),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: new Stack(
                    children: <Widget>[
                      new Positioned(
                          top: 8,
                          right: 8,
                          child: new Image.asset(
                            "assets/like.png",
                            width: 20,
                            height: 20,
                          )),
                      new Positioned(
                        right: 8,
                        bottom: 50,
                        child: new Text(
                          "50 %",
                          style: new TextStyle(
                              color: const Color(0xffA71E26), fontSize: 15),
                        ),
                      ),
                      new Positioned(
                          top: 8,
                          left: 16,
                          child: new Image.asset(
                            "assets/fish (2).png",
                            width: 80,
                            height: 100,
                          )),
                      new Positioned(
                        bottom: 80,
                        left: 8,
                        child: new Text(
                          "Fish",
                          style: new TextStyle(
                              color: const Color(0xffA71E26), fontSize: 15),
                        ),
                      ),
                      new Positioned(
                        bottom: 60,
                        left: 8,
                        child: new Row(
                          children: <Widget>[
                            new StarRating(
                              rating: listProductRating,
                              size: 15,
                              color: Colors.orangeAccent,
                              borderColor: Colors.grey,
                              starCount: 5,
                              onRatingChanged: (_rating) => setState(
                                    () {
                                      this.listProductRating = _rating;
                                    },
                                  ),
                            )
                          ],
                        ),
                      ),
                      new Positioned(
                        bottom: 40,
                        left: 8,
                        child: new Row(
                          children: <Widget>[
                            new Text(
                              r"200 $",
                              style: new TextStyle(
                                  color: Colors.grey[400], fontSize: 15),
                            ),
                            new Container(
                              width: 20,
                            ),
                            new Text(
                              r"200 $",
                              style: new TextStyle(
                                  color: const Color(0xffA71E26), fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      new Positioned(
                        bottom: 10,
                        left: 8,
                        child: InkWell(
                          child: new Container(
                            height: 30.0,
                            width: MediaQuery.of(context).size.width / 4,
                            child: new Material(
                                color: const Color(0xffA71E26),
                                elevation: 0.0,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(12.0),
                                    side: BorderSide(
                                        color: Colors.white, width: 2.0)),
                                child: new Center(
                                    child: new Padding(
                                        padding: new EdgeInsets.only(
                                            top: 8.0, bottom: 8.0),
                                        child: Row(
                                          children: <Widget>[
                                            new Container(
                                              width: 4,
                                            ),
                                            new Image.asset(
                                              "assets/shopping-cart-of-checkered-design.png",
                                              width: 20,
                                              height: 20,
                                            ),
                                            new Container(
                                              width: 8,
                                            ),
                                            new Text(
                                              "ADD TO CART",
                                              style: new TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 8.0,
                                                  fontFamily: 'JF Flat'),
                                            ),
                                          ],
                                        )))),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(),
            child: new Column(
              children: <Widget>[
                new Image.asset(
                  "assets/frute.png",
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                ),
                new Text(
                  "All Category",
                  style: new TextStyle(
                      color: const Color(0xffA71E26), fontSize: 24),
                ),

                new Container(
                    height: MediaQuery.of(context).size.height / 6,
                    child: allCategoryList()),
                new Text(
                  "Sale",
                  style: new TextStyle(
                      color: const Color(0xffA71E26), fontSize: 24),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2.8,
                  child: saleList(),
                ),

                new Text(
                  "Sale",
                  style: new TextStyle(
                      color: const Color(0xffA71E26), fontSize: 24),
                ),

                listProduct(),

                // saleList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
