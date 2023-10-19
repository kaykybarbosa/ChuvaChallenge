import 'package:chuva_dart/app/data/models/my_html.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class BaseEntity{
  int? id;
  MyHtml? title;

  BaseEntity({this.id, this.title});

  factory BaseEntity.fromJson(Map<String, dynamic> json) => _$BaseEntityFromJson(json);
}