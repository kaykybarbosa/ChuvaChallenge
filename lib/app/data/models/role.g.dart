// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
      id: json['id'] as int?,
      label: json['label'] == null
          ? null
          : MyHtml.fromJson(json['label'] as Map<String, dynamic>),
    );