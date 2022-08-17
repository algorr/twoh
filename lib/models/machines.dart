import 'package:twoh/models/errors.dart';

class Machines {
  int? id;
  String? title;
  bool? isFailure;
  String? imagePath;
  double? wpPercent;
  double? epPercent;
  double? lpPercent;
  List<Errors>? error;

  Machines(
      {this.id,
      this.title,
      this.isFailure,
      this.imagePath,
      this.wpPercent,
      this.epPercent,
      this.lpPercent,
      this.error});

  Machines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isFailure = json['isFailure'] == "true";
    imagePath = json['imagePath'];
    wpPercent = json['wpPercent'];
    epPercent = json['epPercent'];
    lpPercent = json['lpPercent'];
    if (json['ariza'] != null) {
      error = <Errors>[];
      json['ariza'].forEach((v) {
        error!.add(Errors.fromJson(v));
      });
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
}
