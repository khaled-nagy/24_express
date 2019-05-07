import 'package:express/api/express_api.dart';
import 'package:express/drawer.dart';
import 'package:express/modules/cart_product.dart';
import 'package:express/modules/count.dart';
import 'package:express/modules/user_m.dart';
import 'package:express/ui/my_order.dart';
import 'package:flutter/material.dart';
import 'package:express/ui/main_home.dart';
import 'package:express/ui/today_deals.dart';
import 'package:express/ui/shopping_cart.dart';
import 'package:express/ui/hearts.dart';
import 'package:express/ui/categoryes.dart';
import 'package:badges/badges.dart';

class BottomNavigation extends StatefulWidget {


  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<BottomNavigation> {

 int countCart;



  cartCountApi(){
    setState(() {
      apiCall= false ;
    });

    ExpressApi().cartCount(userM.id).then((response){
      setState(() {
        apiCall = true;
        this.countCart = response.count;
      });

    },onError: (error){
      print("cart count error $error");
      setState(() {
        apiCall = true ;
      });
    });
  }




  List<CartProducts> cartProductsList = new List();
  bool apiCall = true;
  UserM userM = new UserM();

  bool error = true ;
  String errorMsg = "";
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

  @override
  void initState() {

    UserLocalStorage().getUser().then((user) {
      setState(() {
        this.userM = user;
        print(userM.id);
      });
      getAllCartProductsApi();
    }, onError: () {});
    _pageController = new PageController();

    UserCountLocalStorage().getUserCount().then((count){
      cartCountApi();
      setState(() {
        this.countCart = count.count;
      });
    },onError: (){});


  }



  GlobalKey<ScaffoldState> _globalKeyScafoldState =
      new GlobalKey<ScaffoldState>();
  TextEditingController _searchController = new TextEditingController();

  var index = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _page = 0;
  PageController _pageController;

  navigationTapped(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 100), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    print(page);
    setState(() {
      this._page = page;
    });
  }

  title() {
    if (_page == 1)
      return "الاعلانات التجاريه";
    else if (_page == 2)
      return "رفع اعلان";
    else if (_page == 3) return "الملف الشخصي";
  }



  CartProducts cartProducts ;

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarItem Home = new BottomNavigationBarItem(
        title: new Container(),
        icon: new Column(
          children: <Widget>[
            new Container(
                width: 24.0,
                height: 24.0,
                child: new Image.asset(_page == 0
                    ? "assets/home.png"
                    : "assets/home_deactive.png")),
            new Container(height: 4.0),
            new Text("Home",
                style: new TextStyle(
                  color: const Color(0xffA71E26),
                  fontSize: 12.0,
                ))
          ],
        ));

    BottomNavigationBarItem Deals = new BottomNavigationBarItem(
        title: new Container(),
        icon: new Column(
          children: <Widget>[
            new Container(
                width: 24.0,
                height: 24.0,
                child: new Image.asset(_page == 1
                    ? "assets/percentage.png"
                    : "assets/percentage_deactive.png")),
            new Container(height: 4.0),
            new Text("Today Deals",
                style: new TextStyle(
                  color: const Color(0xffA71E26),
                  fontSize: 12.0,
                ))
          ],
        ));

    BottomNavigationBarItem Category = new BottomNavigationBarItem(
        title: new Container(),
        icon: new Column(
          children: <Widget>[
            new Container(
                width: 24.0,
                height: 24.0,
                child: new Image.asset(_page == 2
                    ? "assets/shopping-basket.png"
                    : "assets/shopping-basket_deactive.png")),
            new Container(height: 4.0),
            new Text("Category",
                style: new TextStyle(
                  color: const Color(0xffA71E26),
                  fontSize: 12.0,
                ))
          ],
        ));

    BottomNavigationBarItem Order = new BottomNavigationBarItem(
        title: new Container(),
        icon: new Column(
          children: <Widget>[
            new Container(
                width: 24.0,
                height: 24.0,
                child: new Image.asset(_page == 3
                    ? "assets/shopping-cart.png"
                    : "assets/shopping-cart_deactive.png")),
            new Container(height: 4.0),
            new Text("My Order",
                style: new TextStyle(
                  color: const Color(0xffA71E26),
                  fontSize: 12.0,
                ))
          ],
        ));

    BottomNavigationBarItem Heart = new BottomNavigationBarItem(
        title: new Container(),
        icon: new Column(
          children: <Widget>[
            new Container(
                width: 24.0,
                height: 24.0,
                child: new Image.asset(_page == 4
                    ? "assets/like.png"
                    : "assets/like_deactive.png")),
            new Container(height: 4.0),
            new Text("Heart Marks",
                style: new TextStyle(
                  color: const Color(0xffA71E26),
                  fontSize: 12.0,
                ))
          ],
        ));

    Widget btns = new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          Home,
          Deals,
          Category,
          Order,
          Heart,
        ],
        onTap: navigationTapped,
        currentIndex: _page);

    return new Scaffold(
      drawer: DrawerW().showDrawer(context),
      key: _globalKeyScafoldState,
      bottomNavigationBar: btns,
      appBar: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xff363636),
              ),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      child: new Image.asset(
                        "assets/list.png",
                        width: 25,
                        height: 25,
                      ),
                      onTap: () {
                        _globalKeyScafoldState.currentState.openDrawer();
                      },
                    ),
                    new Container(
                      width: 200,
                      height: 40.0,
                      child: new Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        color: const Color(0xffFBF7F6),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 6.0, right: 16.0, left: 16.0),
                          child: new TextField(
                            controller: _searchController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.only(right: 0.0, top: 2.0),
                              icon: InkWell(
                                child: new Icon(
                                  Icons.search,
                                  color: Colors.grey[400],
                                ),
                                onTap: () {},
                              ),
                              hintText: "",
                              hintStyle: new TextStyle(color: Colors.black),
                            ),
                            onChanged: (text) {
                              //searchCategories(text);
                            },
                          ),
                        ),
                      ),
                    ),
                    BadgeIconButton(
                      itemCount:  countCart==null ? 0 : countCart,
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 30,
                        color: Colors.white,
                      ),
                      badgeTextColor: Colors.white,
                      badgeColor: Colors.red,
                      hideZeroCount: true,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShoppingCart()));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          preferredSize: Size(MediaQuery.of(context).size.width, 50)),
      body: new PageView(
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
          reverse: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            new MainHome(),
            new TodayDeals(),
            new Categoryes(),
            new MyOrder(),
            new Hearts(),
          ],
          controller: _pageController,
          onPageChanged: onPageChanged),
      /**/
    );
  }
}
