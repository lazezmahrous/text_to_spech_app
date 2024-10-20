import 'package:freezed_annotation/freezed_annotation.dart';
part 'text_to_spech_request_body.g.dart';

@JsonSerializable()
class TextToSpechRequestBody {
  final String text;
  final String language;

  TextToSpechRequestBody({required this.text, required this.language});

  Map<String, dynamic> toJson() => _$TextToSpechRequestBodyToJson(this);
}
