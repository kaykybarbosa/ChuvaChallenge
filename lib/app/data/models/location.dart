import 'package:chuva_dart/app/data/models/base/base_entity.dart';
import 'package:chuva_dart/app/data/models/my_html.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable(explicitToJson: true)
class Location extends BaseEntity{
  int? parent;
  String? map;

  Location({id, title, this.parent, this.map}) : super(id: id, title: title);

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}