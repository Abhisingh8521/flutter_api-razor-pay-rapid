import 'dart:convert';

DistrictAndStateModel districtAndStateModelFromJson(String str) => DistrictAndStateModel.fromJson(json.decode(str));

String districtAndStateModelToJson(DistrictAndStateModel data) => json.encode(data.toJson());

class DistrictAndStateModel {
  String? district;
  String? state;

  DistrictAndStateModel({
    this.district,
    this.state,
  });

  factory DistrictAndStateModel.fromJson(Map<String, dynamic> json) => DistrictAndStateModel(
    district: json["district"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "district": district,
    "state": state,
  };
}
