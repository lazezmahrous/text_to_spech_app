// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_to_spech_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextToSpechResponse _$TextToSpechResponseFromJson(Map<String, dynamic> json) =>
    TextToSpechResponse(
      audioContent: json['file_url'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$TextToSpechResponseToJson(
        TextToSpechResponse instance) =>
    <String, dynamic>{
      'file_url': instance.audioContent,
      'message': instance.message,
    };
