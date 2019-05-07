class Category {
  int id, cat_id, sort, view, status, type;
  String title, title_ar, desc, desc_ar, img, created_at , updated_at , code;
  List<SubCategory> subCategory ;

  Category(
      {this.id,
      this.type,
      this.cat_id,
      this.sort,
      this.view,
      this.title,
      this.title_ar,
      this.desc,
      this.desc_ar,
      this.code,
      this.status,
      this.img,
      this.created_at,
      this.updated_at,
      this.subCategory});
  factory Category.fromJson(Map<String, dynamic> json) {
    var list = json['subCategory'] as List;
    print(list.runtimeType);
    List<SubCategory> subCategoryList = list.map((i) => SubCategory.fromJson(i)).toList();
    return new Category(
      id: json['id'],
      type: json['type'],
      cat_id: json['cat_id'],
      sort: json['sort'],
      view: json['view'],
      title: json['title'],
      title_ar: json['title_ar'],
      desc: json['desc'],
      desc_ar: json['desc_ar'],
      code: json['code'],
      status: json['status'],
      img: json['img'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      subCategory: subCategoryList,
    );
  }
}


class SubCategory {
  int id ,status , type , cat_id , sort , view ;
  String title ,title_ar , img , code , created_at , updated_at ,desc , desc_ar ;

  SubCategory({this.id, this.status, this.type, this.cat_id, this.sort,
    this.view, this.title, this.title_ar, this.img, this.code,
    this.created_at, this.updated_at, this.desc, this.desc_ar});

  factory SubCategory.fromJson(Map < String , dynamic > json){
    return new SubCategory(
      id: json['id'],
      title: json['title'],
      title_ar: json['title_ar'],
      desc: json['desc'],
      desc_ar: json['desc_ar'],
      img: json['img'],
      status: json['status'],
      type: json['type'],
      cat_id: json['cat_id'],
      sort: json['sort'],
      view: json['view'],
      code: json['code'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }


}

