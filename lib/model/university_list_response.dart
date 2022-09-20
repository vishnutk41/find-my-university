// To parse this JSON data, do
//
//     final universityListResponseModel = universityListResponseModelFromJson(jsonString);

import 'dart:convert';

List<UniversityListResponseModel> universityListResponseModelFromJson(
        String str) =>
    List<UniversityListResponseModel>.from(
        json.decode(str).map((x) => UniversityListResponseModel.fromJson(x)));

class UniversityListResponseModel {
  UniversityListResponseModel({
    required this.domains,
    required this.alphaTwoCode,
    required this.country,
    required this.webPages,
    required this.name,
    required this.stateProvince,
  });

  List<String> domains;
  String alphaTwoCode;
  String country;
  List<String> webPages;
  String name;
  String stateProvince;

  factory UniversityListResponseModel.fromJson(Map<String, dynamic> json) =>
      UniversityListResponseModel(
        domains: List<String>.from(json["domains"].map((x) => x)),
        alphaTwoCode: json["alpha_two_code"],
        country: json["country"],
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
        name: json["name"],
        stateProvince: json["state-province"] ?? "",
      );
}
