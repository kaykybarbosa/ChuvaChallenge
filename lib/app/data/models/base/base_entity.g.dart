// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseEntity _$BaseEntityFromJson(Map<String, dynamic> json) => BaseEntity(
      id: json['id'] as int?,
      title: json['title'] == null
          ? null
          : MyHtml.fromJson(json['title'] as Map<String, dynamic>),
    );