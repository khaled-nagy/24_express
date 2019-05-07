import 'package:express/modules/category.dart';
import 'package:express/modules/product_l_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:express/drawer.dart';
import 'package:express/api/express_api.dart';

class Product extends StatefulWidget {
  int cat_id;
  Product(this.cat_id);
  @override
  _ProductState createState() => _ProductState(cat_id);
}

class _ProductState extends State<Product> {
  GlobalKey<ScaffoldState> _globalKeyScafoldStateProduct =
      new GlobalKey<ScaffoldState>();

  void bottomSheetSubCategory(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return new Container(
            height: MediaQuery.of(context).size.height / 3,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height / 1.5,
              minHeight: MediaQuery.of(context).size.height / 3,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400], width: 1)),
                    height: 50,
                    child: Row(
                      children: <Widget>[
                        new Container(
                          width: 8,
                        ),
                        Text(
                          "Sub Categorys",
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  ListBottom(),
                ],
              ),
            ),
          );
        });
  }

  Widget ListBottom() {
    if (!apiCall) {
      return new ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: subCategoryList.length,
          physics: ClampingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return listItemBottom(subCategoryList[index]);
          });
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Widget listItemBottom(SubCategory subCategory) {
    return Container(
        height: 50,
        child: Center(
          child: Row(
            children: <Widget>[
              new Container(
                width: 50,
              ),
              new Image.network(
                "http://ex-24.com/images/Category/" + subCategory.img,
                width: 50,
                height: 50,
              ),
              new Container(
                width: 16,
              ),
              Text(subCategory.title.toString() == null
                  ? ""
                  : subCategory.title.toString()),
            ],
          ),
        ));
  }

  List<ProductL3> prductList = new List();
  List<SubCategory> subCategoryList = new List();

  int cat_id;
  bool apiCall = false;

  _ProductState(this.cat_id);

  double seleListRatingHearts = 3.5;

  Widget customBody() {
    if (!apiCall) {
      apiCall = false;

      if (prductList.length == 0) {
        apiCall = true;
        return Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Center(
              child: Image.asset(
                "assets/empty-box.png",
                width: 150,
                height: 150,
              ),
            ));
      } else {
        apiCall = false;
        return new ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: prductList.length,
            physics: ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return listItemProductL3(prductList[index]);
            });
      }
    } else {
      apiCall = false;
      return Padding(
        padding: const EdgeInsets.only(top: 300),
        child: new Center(
          child: new CircularProgressIndicator(),
        ),
      );
    }
  }

  Widget listItemProductL3(ProductL3 pro) {
    return new Container(
      height: MediaQuery.of(context).size.height / 3.8,
      width: MediaQuery.of(context).size.width,
      child: new Card(
        color: const Color(0xffF4F4F4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                top: 8,
                left: 16,
                child: new Image.network(
                  "http://ex-24.com/images/Products/" + pro.img.split(',')[0],
                  width: 120,
                  height: 150,
                )),
            new Positioned(
              top: 16,
              left: 160,
              child: new Text(
                pro.title,
                style:
                    new TextStyle(color: const Color(0xffA71E26), fontSize: 18),
              ),
            ),
            new Positioned(
              top: 33,
              left: 160,
              child: new Row(
                children: <Widget>[
                  new StarRating(
                    rating: seleListRatingHearts,
                    size: 18,
                    color: Colors.orangeAccent,
                    borderColor: Colors.grey,
                    starCount: 5,
                    onRatingChanged: (_rating) => setState(
                          () {
                            this.seleListRatingHearts = _rating;
                          },
                        ),
                  )
                ],
              ),
            ),
            new Positioned(
              top: 53,
              left: 160,
              child: new Text(
                "vegetabls box",
                style:
                    new TextStyle(color: const Color(0xffA71E26), fontSize: 18),
              ),
            ),
            new Positioned(
              top: 78,
              left: 160,
              child: new Row(
                children: <Widget>[
                  new Text(
                    pro.price.toString() + r" $",
                    style: new TextStyle(color: Colors.grey[400], fontSize: 18),
                  ),
                  new Container(
                    width: 20,
                  ),
                  new Text(
                    pro.sale_price.toString() + r" $",
                    style: new TextStyle(
                        color: const Color(0xffA71E26), fontSize: 18),
                  ),
                ],
              ),
            ),
            new Positioned(
              top: 100,
              left: 160,
              child: InkWell(
                child: new Container(
                  height: 35.0,
                  width: MediaQuery.of(context).size.width / 3,
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
            ),
          ],
        ),
      ),
    );
  }

  void ProductL3Api() {
    setState(() {
      apiCall = true;
    });
    new ExpressApi().getProductL3(cat_id).then((response) {
      print("done");
      setState(() {
        this.prductList = response.productL3List;
        apiCall = false;
      });
    }, onError: (error) {
      print("product L3 error $error");
      setState(() {
        apiCall = false;
      });
    });
  }

  void subCategoryApi() {
    setState(() {
      apiCall = true;
    });
    new ExpressApi().getSubCategory(cat_id).then((response) {
      setState(() {
        this.subCategoryList = response.subCategoryList;

        apiCall = false;
      });
    }, onError: (error) {
      print("subCategory error $error");
      setState(() {
        apiCall = false;
      });
    });
  }

  @override
  void initState() {
    print("category_id$cat_id");
    ProductL3Api();
    subCategoryApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerW().showDrawer(context),
      appBar: new AppBar(
//        leading: IconButton(icon: Icon(Icons.menu , size: 30, color: Colors.white,),
//            onPressed: (){
//              _globalKeyScafoldStateProduct.currentState.openDrawer();
//            }),
        centerTitle: true,
        title: new Text(
          "chicken & poultry",
          style: new TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff363636),
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: new Column(
            children: <Widget>[
              new Container(
                height: 50,
                color: const Color(0xffD4D4D4),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              "assets/category.png",
                              width: 30,
                              height: 30,
                            ),
                            Container(
                              width: 4,
                            ),
                            Text("Sub Category"),
                          ],
                        ),
                      ),
                      onTap: () {
                        bottomSheetSubCategory(context);

                      },
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            "assets/filter-tool-black-shape.png",
                            width: 30,
                            height: 30,
                          ),
                          Container(
                            width: 4,
                          ),
                          Text("Filter"),
                        ],
                      ),
                    ),
                    new Icon(
                      Icons.list,
                      size: 30,
                    )
                  ],
                ),
              ),
              customBody(),
            ],
          ),
        ),
      ),
    );
  }
}
