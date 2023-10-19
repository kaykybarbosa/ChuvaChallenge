import 'package:json_annotation/json_annotation.dart';

part 'my_html.g.dart'; 

@JsonSerializable()
class MyHtml{
  @JsonKey(name: 'pt-br')
  String? ptBr;

  MyHtml({this.ptBr});

  factory MyHtml.fromJson(Map<String, dynamic> json) => _$MyHtmlFromJson(json);
}