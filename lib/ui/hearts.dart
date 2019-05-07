import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class Hearts extends StatefulWidget {
  @override
  _HeartsState createState() => _HeartsState();
}

class _HeartsState extends State<Hearts> {

  @override
  void dispose() {

    super.dispose();
  }
  double seleListRatingHearts = 3.5 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (BuildContext context ,int index){
            return new Column(
                  children: <Widget>[
                    new Container(
                      height: MediaQuery.of(context).size.height / 3.8,
                      width: MediaQuery.of(context).size.width,

                      child: new Card(
                        color: const Color(0xffF4F4F4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: new Stack(
                          children: <Widget>[
                            new Positioned(
                                top: 32,
                                left: 110,
                                child: new Image.asset("assets/like.png",width: 20,height: 20,)),
                            new Positioned(
                                top: 8,
                                left: 16,
                                child: new Image.asset("assets/vegetabls.png",width: 120,height: 150,)),
                            new Positioned(
                              top: 16,
                              left: 160,

                              child: new Text(
                                "Frish",
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
                                    r"200 $",
                                    style:
                                    new TextStyle(color: Colors.grey[400], fontSize: 18),
                                  ),
                                  new Container(width: 20,),
                                  new Text(
                                    r"200 $",
                                    style:
                                    new TextStyle(color: const Color(0xffA71E26), fontSize: 18),
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
                                  width: MediaQuery.of(context).size.width/3,
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
                                                  new Container(width: 4,),
                                                  new Image.asset("assets/shopping-cart-of-checkered-design.png",width: 20,height: 20,),
                                                  new Container(width: 8,),
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
                                onTap: () {

                                },
                              ),
                            ),




                          ],
                        ),
                      ),
                    )
                  ],
                );

          }),
    );
  }
}
