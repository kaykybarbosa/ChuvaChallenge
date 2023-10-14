// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      json['id'] as int?,
      json['title'] == null
          ? null
          : MyHtml.fromJson(json['title'] as Map<String, dynamic>),
      json['color'] as String?,
      json['background-color'] as String?,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title?.toJson(),
      'color': instance.color,
      'background-color': instance.backgroudColor,
    };
