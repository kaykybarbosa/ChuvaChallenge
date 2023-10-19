
import 'package:chuva_dart/app/data/models/base/base_entity.dart';
import 'package:chuva_dart/app/data/models/my_html.dart';
import 'package:json_annotation/json_annotation.dart';

part 'type_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TypeModel extends BaseEntity{

  TypeModel({id, title}) : super(id: id, title: title);

  factory TypeModel.fromJson(Map<String, dynamic> json) => _$TypeModelFromJson(json);
}