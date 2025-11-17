class Homemodel {
  int? notesId;
  String? notesTitle;
  String? notesContent;
  String? notesImage;
  int? notesUsers;
  String? notescreated_at;
  String? notesdue_date;


  Homemodel(
      {this.notesId,
        this.notesTitle,
        this.notesContent,
        this.notesImage,
        this.notesUsers,
        this.notescreated_at,
        this.notesdue_date,

      });

  Homemodel.fromJson(Map<String, dynamic> json) {
    notesId = json['notes_id'];
    notesTitle = json['notes_title'];
    notesContent = json['notes_content'];
    notesImage = json['notes_image'];
    notesUsers = json['notes_users'];
    notescreated_at = json['created_at'];
    notesdue_date = json['due_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notes_id'] = this.notesId;
    data['notes_title'] = this.notesTitle;
    data['notes_content'] = this.notesContent;
    data['notes_image'] = this.notesImage;
    data['notes_users'] = this.notesUsers;
    data['created_at'] = this.notescreated_at;
    data['due_date'] = this.notesdue_date;

    return data;
  }
}