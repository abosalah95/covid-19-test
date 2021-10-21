import 'dart:convert';

class DataModel {
  String date;
  List<dynamic> countries;
  int confirmed;
  int deaths;
  int recovered;
  int active;
  int deltaConfirmed;
  int deltaDeaths;
  int deltaRecovered;
  int deltaActive;


  DataModel({
    this.date,
    this.countries,
    this.confirmed,
    this.deaths,
    this.recovered,
    this.active,
    this.deltaConfirmed,
    this.deltaDeaths,
    this.deltaRecovered,
    this.deltaActive,
  });
  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    date: json["date"],
    countries: json["countries"],
    confirmed: json["confirmed"],
    deaths: json["deaths"],
    recovered: json["recovered"],
    active: json["active"],
    deltaConfirmed: json["deltaConfirmed"],
    deltaDeaths: json["deltaDeaths"],
    deltaRecovered: json["deltaRecovered"],
    deltaActive: json["deltaActive"],
  );
}
