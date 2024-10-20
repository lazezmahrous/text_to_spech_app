import 'package:retrofit/retrofit.dart';
import 'package:text_to_spech/features/home/data/models/text_to_spech_response.dart';
import '../../features/home/data/models/text_to_spech_request_body.dart';
import 'api_constans.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.textToSpech)
  Future<TextToSpechResponse> sendTextToSpech(
    @Body() TextToSpechRequestBody textToSpechRequestBody,
  );
}
