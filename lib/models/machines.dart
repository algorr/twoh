class Machines {
  int? id;
  String? title;
  bool? isFailure;

  Machines({this.id, this.title, this.isFailure});

  Machines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isFailure = json['isFailure'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['isFailure'] = isFailure;
    return data;
  }
}