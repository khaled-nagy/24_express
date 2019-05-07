import 'package:flutter/material.dart';

class TodayDeals extends StatefulWidget {
  @override
  _TodayDealsState createState() => _TodayDealsState();
}

class _TodayDealsState extends State<TodayDeals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: new Column(
          children: <Widget>[

            new ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context , int index){
                return new Container(
                  child: new Column(
                    children: <Widget>[

                      new Text(
                        "Frute",
                        style:
                        new TextStyle(color: const Color(0xffA71E26), fontSize: 24),
                      ),
                      new Image.asset(
                        "assets/frute5.png",
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3.2,
                      ),

                    ],
                  ),
                );
                }),

          ],
        ),
      ),
    );
  }
}
