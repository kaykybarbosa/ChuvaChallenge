import 'package:chuva_dart/app/data/models/my_html.dart';
import 'package:json_annotation/json_annotation.dart';

part 'role.g.dart';

@JsonSerializable(explicitToJson: true)
class Role{
  int? id;
  MyHtml? label;

  Role({
    this.id,
    this.label
  });

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
}