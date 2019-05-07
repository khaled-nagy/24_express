import 'package:shared_preferences/shared_preferences.dart';

class UserM {
  int id;
  String firstName;
  String lastName;
  String email;
  String password;
  String token;

  UserM({this.id, this.firstName, this.lastName, this.email, this.password,this.token});

  factory UserM.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return UserM(
        id: json["id"],
        firstName: json["name"],
        lastName: json["last_name"],
        email: json["email"],
        password: json["password"],
        token: json["userToken"],
      );
    } else {
      return null;
    }
  }
}

class UserLocalStorage {
  Future<bool> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear() ;
    return true ;
  }

  Future<bool> saveUser(UserM user) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setInt("userId", user.id);
      await prefs.setString("name", user.firstName);
      await prefs.setString("last_name", user.lastName);
      await prefs.setString("userEmail", user.email);
      await prefs.setString("userPassword", user.password);
      await prefs.setString("userToken", user.token);
      return true ;
    }catch(Excption){
      print("save to shared faild   :  $Excption");
      return false ;
    }
  }

  Future< UserM > getUser () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return new UserM(
        id: prefs.getInt("userId"),
        firstName: prefs.getString("name"),
      lastName: prefs.getString("last_name"),
        email: prefs.getString("userEmail"),
        password: prefs.getString("userPassword"),
        token: prefs.getString("userToken"),

    );

  }


}
