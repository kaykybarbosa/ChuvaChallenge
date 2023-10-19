import 'package:chuva_dart/app/data/models/base/base_entity.dart';
import 'package:chuva_dart/app/data/models/my_html.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryModel extends BaseEntity{
  String? color;
  @JsonKey(name: 'background-color')
  String? backgroudColor;

  CategoryModel({id, title, this.color, this.backgroudColor}) : super(id: id, title: title);

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
}