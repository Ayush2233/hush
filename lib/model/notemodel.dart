class NoteModel {
  String? noteTitle;
  String? noteBody;
  DateTime? noteDate;

  NoteModel({this.noteTitle, this.noteBody, this.noteDate});

  NoteModel.fromJson(Map<String, dynamic> json) {
    noteTitle = json['note_title'];
    noteBody = json['note_body'];
    noteDate = json['note_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['note_title'] = this.noteTitle;
    data['note_body'] = this.noteBody;
    data['note_date'] = this.noteDate;
    return data;
  }
}