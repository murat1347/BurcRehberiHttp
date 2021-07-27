// To parse this JSON data, do
//
//     final firsat = firsatFromJson(jsonString);

import 'dart:convert';

List<Firsat> firsatFromJson(String str) => List<Firsat>.from(json.decode(str).map((x) => Firsat.fromJson(x)));

String firsatToJson(List<Firsat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Firsat {
  Firsat({
    required this.adi,
    required this.aciklama,
    required this.resim,
  });

  String adi;
  String aciklama;
  String resim;

  factory Firsat.fromJson(Map<String, dynamic> json) => Firsat(
    adi: json["adi"],
    aciklama: json["aciklama"],
    resim: json["resim"],
  );

  Map<String, dynamic> toJson() => {
    "adi": adi,
    "aciklama": aciklama,
    "resim": resim,
  };
}
