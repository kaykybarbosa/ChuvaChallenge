// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      id: json['id'],
      title: json['title'] == null ? null : MyHtml.fromJson(json['title']),
      parent: json['parent'] as int?,
      map: json['map'] as String?,
    );