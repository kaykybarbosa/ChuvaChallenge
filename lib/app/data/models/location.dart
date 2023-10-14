import 'package:chuva_dart/app/data/models/my_html.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable(explicitToJson: true)
class Location{
  int? id;
  MyHtml? title;
  int? parent;
  String? map;

  Location({this.id, this.title, this.parent, this.map});

  static fromJson(Map<String, dynamic> e) {}

  toJson() {}

}