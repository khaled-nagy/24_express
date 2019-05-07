import 'package:express/modules/cart_product.dart';
import 'package:express/modules/category.dart';
import 'package:express/modules/count.dart';
import 'package:express/modules/get_category_most_view.dart';
import 'package:express/modules/peoduct_details_m.dart';
import 'package:express/modules/product_l_3.dart';
import 'package:express/modules/products.dart';
import 'package:express/modules/user_m.dart';

class ServerResponseRegister {
  bool error;
  String message;
  String errorMsg;

  ServerResponseRegister({this.error, this.message, this.errorMsg});

  factory ServerResponseRegister.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return new ServerResponseRegister(error: true, message: "json is null");
    }
    return new ServerResponseRegister(
        error: json['errors'],
        message: json['message'],
        errorMsg: json['errorMsg']);
  }
}

class ServerResponseLogIn {
  bool error;
  String message;
  UserM user;

  ServerResponseLogIn({this.error, this.message, this.user});

  factory ServerResponseLogIn.fromJson(Map<String, dynamic> json) {
    return new ServerResponseLogIn(
        error: json['errors'],
        message: json['message'],
        user: UserM.fromJson(json['user']));
  }
}

class ServerResponseCategory {
  List<Category> categoryList;
  String message;
  List<int> orderId;

  ServerResponseCategory({this.categoryList, this.message, this.orderId});
  factory ServerResponseCategory.fromJson(Map<String, dynamic> json) {
    var list = json['Categorys'] as List;
    var list2 = json['order_id'] as List;
    List<Category> catList = list.map((i) => Category.fromJson(i)).toList();
    List<int> orderList = list2 != null ? list2.map((i) => i).toList() : [];
    return new ServerResponseCategory(
        categoryList: catList, message: json['message'], orderId: orderList);
  }
}

class ServerResponseSubCategory {
  List<SubCategory> subCategoryList;

  ServerResponseSubCategory({
    this.subCategoryList,
  });
  factory ServerResponseSubCategory.fromJson(Map<String, dynamic> json) {
    var list = json['Categorys'] as List;

    List<SubCategory> catList =
        list.map((i) => SubCategory.fromJson(i)).toList();

    return new ServerResponseSubCategory(subCategoryList: catList);
  }
}

class ServerResponseGetCategoryMostView {
  List<GetCategoryMostView> getCategoryMostView;
  String message;

  ServerResponseGetCategoryMostView({this.message, this.getCategoryMostView});
  factory ServerResponseGetCategoryMostView.fromJson(
      Map<String, dynamic> json) {
    var list = json['Categorys'] as List;
    List<GetCategoryMostView> catList =
        list.map((i) => GetCategoryMostView.fromJson(i)).toList();
    return new ServerResponseGetCategoryMostView(
        message: json['message'], getCategoryMostView: catList);
  }
}

class ServerResponseProducts {
  List<Products> productsList1;

  ServerResponseProducts({this.productsList1});
  factory ServerResponseProducts.fromJson(Map<String, dynamic> json) {
    var list = json['Products'] as List;
    List<Products> catList = list.map((i) => Products.fromJson(i)).toList();
    return new ServerResponseProducts(productsList1: catList);
  }
}

class ServerResponseProductsL3 {
  List<ProductL3> productL3List;
  ServerResponseProductsL3({this.productL3List});
  factory ServerResponseProductsL3.fromJson(Map<String, dynamic> json) {
    var list = json['Products'] as List;
    List<ProductL3> catList = list.map((i) => ProductL3.fromJson(i)).toList();
    return new ServerResponseProductsL3(productL3List: catList);
  }
}

class ServerResponseProductDetails {
  List<ProductDetailsM> listProductDetails;

  ServerResponseProductDetails({this.listProductDetails});
  factory ServerResponseProductDetails.fromJson(Map<String, dynamic> json) {
    var list = json['Products'] as List;
    List<ProductDetailsM> catList =
        list.map((i) => ProductDetailsM.fromJson(i)).toList();
    return new ServerResponseProductDetails(listProductDetails: catList);
  }
}

class ServerResponseAddToCart {
  List<CartProducts> cartList;
  bool errors;
  String message, message_ar;
  int count;

  ServerResponseAddToCart(
      {this.errors, this.message, this.message_ar, this.count, this.cartList});

  factory ServerResponseAddToCart.fromJson(Map<String, dynamic> json) {
    print(json);
    var list = json['Products'] as List;
    print("ServerResponse##");
    List<CartProducts> _cartList =
        list.map((i) => CartProducts.fromJson(i)).toList();
    return new ServerResponseAddToCart(
        message: json['message'],
        errors: json['errors'],
        message_ar: json['message_ar'],
        count: json['count'],
        cartList: _cartList);
  }
}

class ServerResponseGetAllCartProduct {
  List<CartProducts> listCartProducts;

  ServerResponseGetAllCartProduct({this.listCartProducts});
  factory ServerResponseGetAllCartProduct.fromJson(Map<String, dynamic> json) {
    var list = json['Products'] as List;

    print(list);
    List<CartProducts> catList =
        list.map((i) => CartProducts.fromJson(i)).toList();
    return new ServerResponseGetAllCartProduct(listCartProducts: catList);
  }
}

class ServerResponseDeleteProductFromCart {
  bool errors;
  String message, message_ar;
  int count;

  ServerResponseDeleteProductFromCart({
    this.errors,
    this.message,
    this.message_ar,
    this.count,
  });

  factory ServerResponseDeleteProductFromCart.fromJson(
      Map<String, dynamic> json) {
    print(json);
    print("ServerResponse##");
    return new ServerResponseDeleteProductFromCart(
        message: json['message'],
        errors: json['errors'],
        message_ar: json['message_ar'],
        count: json['count']);
  }
}


