import 'dart:convert';
import 'package:api_rest/models/user/geo.dart';

Address addressFromJson(String str) => Address.fromMap(json.decode(str));

String addressToJson(Address data) => json.encode(data.toMap());

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo
  });

  factory Address.fromMap(Map<String, dynamic> map) => Address(
        street: map["street"],
        suite: map["suite"],
        city: map["city"],
        zipcode: map["zipcode"],
        geo: Geo.fromMap(map['geo'])
      );

  Map<String, dynamic> toMap() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo.toMap()
      };
}
