import 'package:express/api/express_api.dart';
import 'package:flutter/material.dart';
import 'package:express/modules/category.dart';
import 'package:express/ui/product.dart';


class Categoryes extends StatefulWidget {
  @override
  _CategoryesState createState() => _CategoryesState();
}

class _CategoryesState extends State<Categoryes> {


  List<Category> categoryList = new List();



  bool apiCall = false;

  TextEditingController _searchController = new TextEditingController();

  void CategopryApi() {
    setState(() {
      apiCall = true;
    });
    new ExpressApi().getCategory().then((response) {
      setState(() {
        this.categoryList = response.categoryList;
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
    CategopryApi();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget customBody() {
    if (!apiCall) {
      if (categoryList.length == 0) {
        return new Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Center(
              child: Text(
                "لا توجد بيانات ",
                style: new TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ));
      } else {
        return new ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return listItem(categoryList[index]);
            });
      }
    } else {
      return new Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Center(child: CircularProgressIndicator()));
    }
  }

  Widget listItem(Category category) {
    print("list Item renderd : Category");
    return new Card(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new ExpansionTile(
              title: new Text(category.title == null ? "" : category.title),
              leading: new Image.network(
                "http://ex-24.com/images/Category/" + category.img,
                width: 50,
                height: 50,
              ),
              children: <Widget>[
                new ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount:category.subCategory.length,
                    itemBuilder: (context, index) {
                      return new Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                              height: 50,
                              child: Center(child: InkWell(
                                child: Row(
                                  children: <Widget>[
                                    new Container(width: 50,),
                                    new Image.network(
                                      "http://ex-24.com/images/Category/" + category.img,
                                      width: 50,
                                      height: 50,
                                    ),
                                    new Container(width: 16,),
                                    Text(category.subCategory[index].title.toString()==null?"":category.subCategory[index].title.toString()),
                                  ],
                                ),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => new Product(category.subCategory[index].id)));
                                },
                              )))
                        ],
                      );;
                     
                    }),
              ]),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.only(
                top: 15.0, bottom: 15.0, right: 32.0, left: 32.0),
            child: new Container(
              height: 50.0,
              child: new Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                color: const Color(0xffFBF7F6),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 12.0, right: 16.0, left: 16.0),
                  child: new TextField(
                    controller: _searchController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(right: 0.0, top: 2.0),
                      icon: InkWell(
                        child: new Icon(
                          Icons.search,
                          color: Colors.grey[400],
                        ),
                        onTap: () {},
                      ),
                      hintText: "Search",
                      hintStyle: new TextStyle(color: Colors.grey[400]),
                    ),
                    onChanged: (text) {
                      //searchCategories(text);
                    },
                  ),
                ),
              ),
            ),
          ),
          customBody(),
        ],
      ),
    );
  }
}
