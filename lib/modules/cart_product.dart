class CartProducts {
  int id, cat_id, sort, view, status,  brand_id , count ;
  String title, title_ar, desc, desc_ar, img,  code , created_at , updated_at , quantity;
  double  price , sale_price ;


  CartProducts({this.id, this.cat_id, this.sort, this.view, this.status,
      this.brand_id, this.title, this.title_ar, this.desc, this.desc_ar,
      this.img, this.code, this.created_at, this.updated_at, this.quantity,
      this.price, this.sale_price , this.count});

  factory CartProducts.fromJson(Map < String , dynamic> json){

    return new CartProducts(
      id: json['id'],
      title: json['title'],
      sort: json['sort'],
      title_ar: json['title_ar'],
      cat_id: json['cat_id'],
      price: double.parse( json['price'].toString()) ,
      sale_price: double.parse(json['sale_price'].toString()) ,
      brand_id: json['brand_id'],
      desc: json['desc'],
      desc_ar: json['desc_ar'],
      status: json['status'],
      quantity: json['quantity'] ,
      view: json['view'],
      code: json['code'],
      img: json['img'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      count: json['count'],

    );
  }


}

class Pivot {
  int user_id , product_id ;

  Pivot({this.user_id, this.product_id});

factory Pivot.fromJson(Map<String , dynamic> json){
  return Pivot(
    user_id: json['user_id'],
    product_id: json['product_id']
  );
}
}