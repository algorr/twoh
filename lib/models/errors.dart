class Errors {
  int? id;
  String? title;
  String? arizaDurumu;
  int? arizaKapanmaKodu;

  Errors({this.id, this.title, this.arizaDurumu, this.arizaKapanmaKodu});

  Errors.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    title = json['title'] ?? "";
    arizaDurumu = json['ariza_durumu'] ?? "";
    arizaKapanmaKodu = json['ariza_kapanma_kodu'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['ariza_durumu'] = arizaDurumu;
    data['ariza_kapanma_kodu'] = arizaKapanmaKodu;
    return data;
  }
}
