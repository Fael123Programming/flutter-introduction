import 'dart:convert';

Geo geoFromJson(String str) => Geo.fromJson(json.decode(str));

String geoToJson(Geo data) => json.encode(data.toJson());

class Geo {
    String lat;
    String lng;
    
    Geo({
        required this.lat,
        required this.lng,
    });

    factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}