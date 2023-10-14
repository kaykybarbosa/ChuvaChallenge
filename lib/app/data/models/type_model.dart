
import 'package:chuva_dart/app/data/models/my_html.dart';
import 'package:json_annotation/json_annotation.dart';

part 'type_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TypeModel{
  int? id; 
  MyHtml? title;

  TypeModel({
    this.id,
    this.title
  });

  toJson() {}

  static fromJson(Map<String, dynamic> json) {}
}