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

Map<String, dynamic> _$PeopleToJson(People instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'name': instance.name,
      'institution': instance.institution,
      'bio': instance.bio?.toJson(),
      'picture': instance.picture,
      'weight': instance.weight,
      'role': instance.role?.toJson(),
      'hash': instance.hash,
    };
