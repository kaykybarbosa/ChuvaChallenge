// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['id'] as int?,
      changed: json['changed'] as int?,
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      title: json['title'] == null
          ? null
          : MyHtml.fromJson(json['title'] as Map<String, dynamic>),
      description: json['description'] == null
          ? null
          : MyHtml.fromJson(json['description'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      people: (json['people'] as List<dynamic>?)
          ?.map<People?>((e) =>
              e == null ? null : People.fromJson(e as Map<String, dynamic>))
          .toList(),
      locations: (json['locations'] as List<dynamic>?)?.map<Location?>((e) => Location.fromJson(e)).toList(),
      typeModel: json['type'] == null
          ? null
          : TypeModel.fromJson(json['type'] as Map<String, dynamic>),
      status: json['status'] == 1 ? true : false as bool?,
      weight: json['weight'] as int?,
      addons: json['addons'] as String?,
      parent: json['parent'] as int?,
      event: json['event'] as String?,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'changed': instance.changed,
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'title': instance.title?.toJson(),
      'description': instance.description?.toJson(),
      'category': instance.category?.toJson(),
      'locations': instance.locations?.map((e) => e?.toJson()).toList(),
      'type': instance.typeModel?.toJson(),
      'people': instance.people?.map((e) => e?.toJson()).toList(),
      'status': instance.status,
      'weight': instance.weight,
      'addons': instance.addons,
      'parent': instance.parent,
      'event': instance.event,
    };
