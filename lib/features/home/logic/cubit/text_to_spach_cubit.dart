import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:text_to_spech/features/home/data/models/text_to_spech_response.dart';
import 'package:text_to_spech/features/home/data/repos/text_to_spech_repo.dart';

import '../../data/models/text_to_spech_request_body.dart';

part 'text_to_spach_state.dart';
part 'text_to_spach_cubit.freezed.dart';

class TextToSpachCubit extends Cubit<TextToSpachState> {
  final TextToSpechRepo _textToSpechRepo;
  TextToSpachCubit(this._textToSpechRepo)
      : super(const TextToSpachState.initial());

  TextEditingController text = TextEditingController();
  GlobalKey<FormState> formKay = GlobalKey<FormState>();
  String? languageCode = 'ar';

  void emitTextToSpechStates(
      TextToSpechRequestBody textToSpechRequestBody) async {
    print('El Response Wallahy =================== ${textToSpechRequestBody.language}');
    emit(const TextToSpachState.loading());
    final result = await _textToSpechRepo.sendTextToSpech(
      textToSpechRequestBody,
    );
    result.
    when(
      success: (textToSpechResponse) {
        emit(TextToSpachState.success(data: textToSpechResponse));
      },
      failure: (error) {
        emit(TextToSpachState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
