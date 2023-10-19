// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: json['id'],
      title: json['title'] == null ? null : MyHtml.fromJson(json['title']),
      color: json['color'] as String?,
      backgroudColor: json['background-color'] as String?,
    );