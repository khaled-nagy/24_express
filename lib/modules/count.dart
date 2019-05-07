import 'package:shared_preferences/shared_preferences.dart';

class Count {
int count , wishListCount ;

Count({this.count, this.wishListCount});

factory Count.fromJson(Map< String , dynamic > json){
  return new Count(
    count: json['count'],
    wishListCount: json['wishListCount']
  );
}

}

class UserCountLocalStorage{

  Future<bool> saveUserCount(Count count) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setInt("count", count.count);
      await prefs.setInt("wishListCount", count.wishListCount);
      return true ;
    }catch(Excption){
      print("save to shared Count faild   :  $Excption");
      return false ;
    }
  }

  Future< Count > getUserCount () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return new Count(
      count: prefs.getInt("count"),
      wishListCount: prefs.getInt("wishListCount"),


    );

  }

}