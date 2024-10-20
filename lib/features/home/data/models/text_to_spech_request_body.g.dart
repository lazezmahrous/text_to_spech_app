// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_to_spech_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextToSpechRequestBody _$TextToSpechRequestBodyFromJson(
        Map<String, dynamic> json) =>
    TextToSpechRequestBody(
      text: json['text'] as String,
      language: json['language'] as String,
    );

Map<String, dynamic> _$TextToSpechRequestBodyToJson(
        TextToSpechRequestBody instance) =>
    <String, dynamic>{
      'text': instance.text,
      'language': instance.language,
    };
