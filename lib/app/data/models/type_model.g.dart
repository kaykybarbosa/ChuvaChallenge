// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeModel _$TypeModelFromJson(Map<String, dynamic> json) => TypeModel(
      id: json['id'] as int?,
      title: json['title'] == null
          ? null
          : MyHtml.fromJson(json['title'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypeModelToJson(TypeModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title?.toJson(),
    };
