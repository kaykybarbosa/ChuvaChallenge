import 'package:chuva_dart/app/data/models/my_html.dart';
import 'package:chuva_dart/app/data/models/role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'people.g.dart';

@JsonSerializable(explicitToJson: true)
class People{
  int? id;
  String? title;
  String? name;
  String? institution;
  MyHtml? bio;
  String? picture;
  int? weight;
  Role? role;
  String? hash; 

  People({
    this.id,
    this.title,
    this.name,
    this.institution,
    this.bio,
    this.picture,
    this.weight,
    this.role,
    this.hash
  });

  factory People.fromJson(Map<String, dynamic> json) => _$PeopleFromJson(json);

}