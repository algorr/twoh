class Machines {
  int? id;
  String? title;
  bool? isFailure;
  String? imagePath;

  Machines({this.id, this.title, this.isFailure, this.imagePath});

  Machines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isFailure = json['isFailure'];
    imagePath = json['imagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['isFailure'] = isFailure;
    data['imagePath'] = imagePath;
    return data;
  }
}