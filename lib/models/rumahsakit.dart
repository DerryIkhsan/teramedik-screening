import 'dart:convert';

List<RumahSakit> rumahSakitFromJson(String str) => List<RumahSakit>.from(json.decode(str).map((x) => RumahSakit.fromJson(x)));

class RumahSakit {
  final int id;
  final String rumah_sakit, image, lokasi, deskripsi;

  RumahSakit({
    required this.id,
    required this.rumah_sakit,
    required this.image,
    required this.lokasi,
    required this.deskripsi,
  });

  factory RumahSakit.fromJson(Map<dynamic, dynamic> json) => RumahSakit(
        id: json['id'],
        rumah_sakit: json['rumah_sakit'],
        image: json['image'],
        lokasi: json['lokasi'],
        deskripsi: json['deskripsi'],
      );
}
