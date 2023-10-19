import 'package:chuva_dart/app/data/models/base/base_entity.dart';
import 'package:chuva_dart/app/data/models/category_model.dart';
import 'package:chuva_dart/app/data/models/location.dart';
import 'package:chuva_dart/app/data/models/my_html.dart';
import 'package:chuva_dart/app/data/models/people.dart';
import 'package:chuva_dart/app/data/models/type_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable(explicitToJson: true)
class Event extends BaseEntity{
  int? changed;
  DateTime? start;
  DateTime? end;
  MyHtml? description;
  CategoryModel? category;
  List<Location?>? locations;
  @JsonKey(name: 'type')
  TypeModel? typeModel;
  List<People?>? people;
  bool? status;
  int? weight;
  String? addons;
  int? parent;
  String? event;

  Event({
    id,
    this.changed,
    this.start,
    this.end,
    title,
    this.description,
    this.category,
    this.locations,
    this.typeModel,
    this.people,
    this.status,
    this.weight,
    this.addons,
    this.parent,
    this.event
  }) : super(id: id, title: title);
  
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

}