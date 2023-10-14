import 'package:chuva_dart/app/data/models/my_html.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryModel{
  int? id;
  MyHtml? title;
  String? color;
  @JsonKey(name: 'background-color')
  String? backgroudColor;

  CategoryModel(this.id, this.title, this.color, this.backgroudColor);

  toJson() {}

  static fromJson(Map<String, dynamic> json) {}
}