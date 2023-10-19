// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

People _$PeopleFromJson(Map<String, dynamic> json) => People(
      id: json['id'] as int?,
      title: json['title'] as String?,
      name: json['name'] as String?,
      institution: json['institution'] as String?,
      bio: json['bio'] == null
          ? null
          : MyHtml.fromJson(json['bio'] as Map<String, dynamic>),
      picture: json['picture'] as String?,
      weight: json['weight'] as int?,
      role: json['role'] == null
          ? null
          : Role.fromJson(json['role'] as Map<String, dynamic>),
      hash: json['hash'] as String?,
    );
