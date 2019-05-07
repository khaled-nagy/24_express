class GetCategoryMostView{
int id , status , type , cat_id ,sort , view ;
String title ,code , title_ar , desc , desc_ar , img , created_at , updated_at ;

GetCategoryMostView({this.id, this.status, this.type, this.cat_id, this.sort,
    this.view, this.title, this.title_ar, this.desc, this.desc_ar, this.img,
    this.created_at, this.updated_at, this.code});

factory GetCategoryMostView.fromJson(Map<String, dynamic> json) {

  return new GetCategoryMostView(
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
  );
}
}