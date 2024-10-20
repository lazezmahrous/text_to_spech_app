import 'package:freezed_annotation/freezed_annotation.dart';

part 'text_to_spech_response.g.dart';
@JsonSerializable()
class TextToSpechResponse {
  @JsonKey(name: 'file_url')
  final String? audioContent;
  @JsonKey(name: 'message')
  final String? message;

  TextToSpechResponse({required this.audioContent, required this.message});

  factory TextToSpechResponse.fromJson(Map<String, dynamic> json) =>
    _$TextToSpechResponseFromJson(json);


}
