import 'package:express/api/express_api.dart';
import 'package:express/modules/peoduct_details_m.dart';
import 'package:express/modules/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class ProductDetails extends StatefulWidget {
  int id;

  ProductDetails(this.id);

  @override
  _ProductDetailsState createState() => _ProductDetailsState(id);
}

class _ProductDetailsState extends State<ProductDetails> {
  int id;
  List<ProductDetailsM> productDetailsList = new List();
  _ProductDetailsState(this.id);

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

  bool apiCall = false;

  void productDetailApi() {
    setState(() {
      apiCall = true;
    });
    new ExpressApi().getProductDetails(id).then((response) {
      setState(() {
        this.productDetailsList = response.listProductDetails;
        apiCall = false;
      });
    }, onError: (error) {
      print("Product Details error $error");
      apiCall = false;
    });
  }

  Widget customBody() {
    if (!apiCall) {
      return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: const Color(0xffEDEDED),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: <Widget>[
                        new Image.network(
                          "http://ex-24.com/images/Products/" +
                              productDetailsList[0].img.split(',')[0],
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: MediaQuery.of(context).size.height / 2,
                        ),
                        new Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                  right: 0,
                                  top: 0,
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    child: new Image.asset(
                                      "assets/like.png",
                                      width: 20,
                                      height: 20,
                                    ),
                                  )),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: new Text(
                                  productDetailsList[0].title,
                                  style: new TextStyle(
                                      color: const Color(0xff75B0DF),
                                      fontSize: 18),
                                ),
                              ),
                              Positioned(
                                top: 30,
                                left: 0,
                                child: new StarRating(
                                  rating: RatingDetails,
                                  size: 18,
                                  color: Colors.orangeAccent,
                                  borderColor: Colors.grey,
                                  starCount: 5,
                                  onRatingChanged: (_rating) => setState(
                                        () {
                                      this.RatingDetails = _rating;
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 16,
                        ),
                        Row(
                          children: <Widget>[
                            new Text(
                              productDetailsList[0].desc,
                              style: new TextStyle(
                                  color: const Color(0xffA71E26), fontSize: 15),
                            ),
                          ],
                        ),
                        new Container(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  new Text(
                                    productDetailsList[0].price.toString(),
                                    style: new TextStyle(fontSize: 15),
                                  ),
                                  Container(
                                    width: 16,
                                  ),
                                  new Text(
                                    productDetailsList[0].sale_price.toString(),
                                    style: new TextStyle(
                                        color: const Color(0xffA71E26),
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  new Text(
                                    " Quantity",
                                    style: new TextStyle(fontSize: 15),
                                  ),
                                  Container(
                                    height: 35,
                                    width: 80,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      color: const Color(0xffA71E26),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
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
                                            _counter.toString(),
                                            style: new TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
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
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            InkWell(
                              child: new Container(
                                height: 35.0,
                                width: MediaQuery.of(context).size.width / 3,
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
                                                      fontSize: 12.0,
                                                      fontFamily: 'JF Flat'),
                                                ),
                                              ],
                                            )))),
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                        Container(
                          height: 16,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      new Text(
                        "200",
                        style: new TextStyle(
                            color: Colors.grey[500],
                            fontSize: 15.0,
                            fontFamily: 'JF Flat'),
                      ),
                      new Text(
                        "Feed Back",
                        style: new TextStyle(
                            color: Colors.grey[500],
                            fontSize: 15.0,
                            fontFamily: 'JF Flat'),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      new Text(
                        productDetailsList[0].order_count.toString(),
                        style: new TextStyle(
                            color: Colors.grey[500],
                            fontSize: 15.0,
                            fontFamily: 'JF Flat'),
                      ),
                      new Text(
                        "Orders",
                        style: new TextStyle(
                            color: Colors.grey[500],
                            fontSize: 15.0,
                            fontFamily: 'JF Flat'),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      new Text(
                        "200",
                        style: new TextStyle(
                            color: Colors.grey[500],
                            fontSize: 15.0,
                            fontFamily: 'JF Flat'),
                      ),
                      new Text(
                        "Wish List",
                        style: new TextStyle(
                            color: Colors.grey[500],
                            fontSize: 15.0,
                            fontFamily: 'JF Flat'),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        );

    } else {

      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  double RatingDetails = 4.5;
  @override
  void initState() {
    print(id);
    productDetailApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: customBody()
    );
  }
}
