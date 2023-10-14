// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      id: json['id'] as int?,
      title: json['title'] == null
          ? null
          : MyHtml.fromJson(json['title'] as Map<String, dynamic>),
      parent: json['parent'] as int?,
      map: json['map'] as String?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title?.toJson(),
      'parent': instance.parent,
      'map': instance.map,
    };
