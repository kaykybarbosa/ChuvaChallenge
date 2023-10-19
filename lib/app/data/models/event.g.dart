// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['id'],
      changed: json['changed'] as int?,
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      title: MyHtml.fromJson(json['title']),
      description: json['description'] == null
          ? null
          : MyHtml.fromJson(json['description'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      locations: (json['locations'] as List<dynamic>?)
          ?.map<Location?>((e) =>
              e == null ? null : Location.fromJson(e as Map<String, dynamic>))
          .toList(),
      typeModel: json['type'] == null
          ? null
          : TypeModel.fromJson(json['type'] as Map<String, dynamic>),
      people: (json['people'] as List<dynamic>?)
          ?.map<People?>((e) =>
              e == null ? null : People.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status']  == 1 ? true : false as bool?,
      weight: json['weight'] as int?,
      addons: json['addons'] as String?,
      parent: json['parent'] as int?,
      event: json['event'] as String?,
    );