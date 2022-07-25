class Machines {
  int? id;
  String? title;
  bool? isFailure;
  String? imagePath;
  double? wpPercent;
  double? epPercent;
  double? lpPercent;

  Machines({this.id, this.title, this.isFailure, this.imagePath, this.wpPercent,this.epPercent,this.lpPercent});

  Machines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isFailure = json['isFailure'] == "true";
    imagePath = json['imagePath'];
    wpPercent = json['wpPercent'];
    epPercent = json['epPercent'];
    lpPercent = json['lpPercent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['isFailure'] = isFailure;
    data['imagePath'] = imagePath;
    data['wpPercent'] = wpPercent;
    data['epPercent'] = wpPercent;
    data['lpPercent'] = wpPercent;
    return data;
  }
}