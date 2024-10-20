import 'package:text_to_spech/core/networking/api_result.dart';
import 'package:text_to_spech/core/networking/api_service.dart';
import 'package:text_to_spech/features/home/data/models/text_to_spech_request_body.dart';
import 'package:text_to_spech/features/home/data/models/text_to_spech_response.dart';

import '../../../../core/networking/api_error_handler.dart';

class TextToSpechRepo {
  final ApiService apiService;
  TextToSpechRepo(this.apiService);

  Future<ApiResult<TextToSpechResponse>> sendTextToSpech(
      TextToSpechRequestBody textToSpechRequestBody) async {
    try {
      final response = await apiService.sendTextToSpech(
        textToSpechRequestBody
      );
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
