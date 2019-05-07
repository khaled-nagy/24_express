
import 'package:express/modules/count.dart';
import 'package:express/modules/product_l_3.dart';
import 'package:express/modules/server_response.dart';
import 'package:express/modules/products.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExpressApi {

  final String Base_Url = "http://ex-24.com";


  Future<ServerResponseLogIn> LogIn(String userName, String password) async {
    final url = Base_Url + "/api/user/login?email=$userName&password=$password";

    final response = await http.post(url);

    final responseJson = json.decode(response.body);

    print(url);
    print("response log in   :   :   :  $responseJson");
    return ServerResponseLogIn.fromJson(responseJson);
  }

  Future<ServerResponseRegister> Register(
      String firstName, String lastName, String email, String password) async {
    final url = Base_Url +
        "/api/user/register?name=$firstName&last_name=$lastName&email=$email&password=$password";
    print(url);
    final response = await http.post(url);
    final responseJson = json.decode(response.body);

    print(" register response  :  :  : $responseJson");

    return new ServerResponseRegister.fromJson(responseJson);
  }
  Future<ServerResponseCategory> getCategory() async {

    final url = Base_Url + "/api/category";
    print(url);
    final response = await http.get(url);
    print(response);
    final responseJson = json.decode(response.body);
    print(responseJson);
    return new ServerResponseCategory.fromJson(responseJson);


  }

  Future<ServerResponseSubCategory> getSubCategory(int id) async {

    final url = Base_Url + "/api/getSub/$id";
    print(url);
    final response = await http.get(url);
    print(response);
    final responseJson = json.decode(response.body);
    print(responseJson);
    return new ServerResponseSubCategory.fromJson(responseJson);


  }

  Future<ServerResponseGetCategoryMostView>  GetCategoryMostView()async{

    final url = Base_Url + "/api/getCategoryMostView";
    print(url);
    final response = await http.get(url);
    print(response);
    final responseJson = json.decode(response.body);
    print(responseJson);
    return new ServerResponseGetCategoryMostView.fromJson(responseJson);

  }

  Future<ServerResponseProducts> getProducts ()async{
    final url = Base_Url + "/api/productWithSale";
    print(url);
    final response = await http.get(url);
    print(response);
    final responseJson = json.decode(response.body);
    print(responseJson);
    return new ServerResponseProducts.fromJson(responseJson);
  }

  Future<ServerResponseProductsL3> getProductL3 (int id)async{
    final url = Base_Url + "/api/product/0?catId=$id";
    print(url);
    final response = await http.get(url);
    print(response);
    final responseJson = json.decode(response.body);
    print(responseJson);
    return new ServerResponseProductsL3.fromJson(responseJson);
  }


  Future<ServerResponseProductDetails> getProductDetails (int id)async{
    final url = Base_Url + "/api/productDetails/$id";
    print(url);
    final response = await http.get(url);
    print(response);
    final responseJson = json.decode(response.body);
    print(responseJson);
    return new ServerResponseProductDetails.fromJson(responseJson);
  }

  Future<ServerResponseAddToCart> getAddToCart (int userId ,int productId) async{
    final url = Base_Url+"/api/addProductToCart/$userId?productId=$productId";
    print(url);
    final response = await http.post(url);
    print(response);
    final reponseJson = json.decode(response.body);
    print(reponseJson);
    return new ServerResponseAddToCart.fromJson(reponseJson);

  }

  Future<ServerResponseGetAllCartProduct> getAllCartProduct (int userId ) async{
    final url = Base_Url+"/api/getAllCartProduct/$userId";
    print(url);
    final response = await http.get(url);
    print(response);
    final reponseJson = json.decode(response.body);
    print(reponseJson);
    return new ServerResponseGetAllCartProduct.fromJson(reponseJson);

  }

  Future<ServerResponseDeleteProductFromCart> deleteCartProduct (int userId ,int productId) async{
    final url = Base_Url+"/api/deleteProductFromCart/$userId?productId=$productId";
    print(url);
    final response = await http.post(url);
    print(response);
    final reponseJson = json.decode(response.body);
    print(reponseJson);
    return new ServerResponseDeleteProductFromCart.fromJson(reponseJson);

  }

  Future<Count> cartCount (int userId ) async{
    final url = Base_Url+"/api/getCartCount/$userId";
    print(url);
    final response = await http.get(url);
    print(response);
    final reponseJson = json.decode(response.body);
    print(reponseJson);
    return new Count.fromJson(reponseJson);
  }

  Future<Count> choosePrice (int userId , int productId , int quantity) async{
    final url = Base_Url+"ChoosePrice/$userId?ids=$productId&qantity=$quantity";
    print(url);
    final response = await http.get(url);
    print(response);
    final reponseJson = json.decode(response.body);
    print(reponseJson);
    return new Count.fromJson(reponseJson);
  }



}


