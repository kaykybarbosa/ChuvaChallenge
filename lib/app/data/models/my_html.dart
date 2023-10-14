import 'package:json_annotation/json_annotation.dart';

part 'my_html.g.dart'; 

@JsonSerializable()
class MyHtml{
  @JsonKey(name: 'pt-br')
  String? pt_br;

  toJson() {}

  static fromJson(Map<String, dynamic> json) {}
}