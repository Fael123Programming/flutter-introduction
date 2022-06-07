import 'dart:convert';

Geo geoFromJson(String str) => Geo.fromMap(json.decode(str));

String geoToJson(Geo geo) => json.encode(geo.toMap());

class Geo {
  String lat;
  String lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromMap(Map<String, dynamic> map) => Geo(
        lat: map["lat"],
        lng: map["lng"],
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lng": lng,
      };


  String toUniqueString() {
    return '$lat $lng';
  }
}
