import 'package:chuva_dart/app/data/models/category_model.dart';
import 'package:chuva_dart/app/data/models/location.dart';
import 'package:chuva_dart/app/data/models/my_html.dart';
import 'package:chuva_dart/app/data/models/people.dart';
import 'package:chuva_dart/app/data/models/type_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable(explicitToJson: true)
class Event{
  int? id;
  int? changed;
  DateTime? start;
  DateTime? end;
  MyHtml? title;
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
    this.id,
    this.changed,
    this.start,
    this.end,
    this.title,
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
  });
  
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

}