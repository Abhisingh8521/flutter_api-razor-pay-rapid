import 'dart:convert';

PinCodeModel pinCodeModelFromJson(String str) => PinCodeModel.fromJson(json.decode(str));

String pinCodeModelToJson(PinCodeModel data) => json.encode(data.toJson());

class PinCodeModel {
  int? pincode;
  String? area;
  double? lat;
  double? lng;
  String? district;
  String? state;

  PinCodeModel({
    this.pincode,
    this.area,
    this.lat,
    this.lng,
    this.district,
    this.state,
  });

  factory PinCodeModel.fromJson(Map<String, dynamic> json) => PinCodeModel(
    pincode: json["pincode"],
    area: json["area"],
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
    district: json["district"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "pincode": pincode,
    "area": area,
    "lat": lat,
    "lng": lng,
    "district": district,
    "state": state,
  };
}