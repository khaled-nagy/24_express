 class ProductDetailsM {

   int id, cat_id, sort, view, status,  brand_id , order_count ;
   String title, title_ar, desc, desc_ar, img,  code , created_at , updated_at , quantity;
   double  price , sale_price ;

   ProductDetailsM({this.id, this.cat_id, this.sort, this.view, this.status,
       this.brand_id, this.order_count, this.title, this.title_ar, this.desc,
       this.desc_ar, this.img, this.code, this.created_at, this.updated_at,
       this.quantity, this.price, this.sale_price});

   factory ProductDetailsM.fromJson(Map<String , dynamic> json){
     return new ProductDetailsM(
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
       order_count: json['order_count'],
       created_at: json['created_at'],
       updated_at: json['updated_at'],
     );
   }


 }