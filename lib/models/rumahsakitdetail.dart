import 'dart:convert';

RumahSakitDetail rumahSakitDetailFromJson(String str) => RumahSakitDetail.fromJson(json.decode(str));

class RumahSakitDetail {
  final int id;
  final String rumah_sakit, image, lokasi, deskripsi;

  RumahSakitDetail({
    required this.id,
    required this.rumah_sakit,
    required this.image,
    required this.lokasi,
    required this.deskripsi,
  });

  factory RumahSakitDetail.fromJson(Map<String, dynamic> json) => RumahSakitDetail(
        id: json['id'],
        rumah_sakit: json['rumah_sakit'],
        image: json['image'],
        lokasi: json['lokasi'],
        deskripsi: json['deskripsi'],
      );
}
