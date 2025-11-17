class Favoritemodel {
  int? id;
  String? title;
  String? content;
  String? createdAt;
  String? dueDate;
  int? favoritesUser;

  Favoritemodel(
      {

        this.id,
        this.title,
        this.content,
        this.createdAt,
        this.dueDate,
        this.favoritesUser});

  Favoritemodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    createdAt = json['created_at'];
    dueDate = json['due_date'];
    favoritesUser = json['favorites_user'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    data['due_date'] = this.dueDate;
    data['favorites_user'] = this.favoritesUser;
    return data;
  }
}