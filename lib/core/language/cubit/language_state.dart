part of 'language_cubit.dart';

@freezed
class LanguageState with _$LanguageState {
  const factory LanguageState.initial() = _Initial;
  const factory LanguageState.getLanguage({required Locale local}) = _GetLanguage;
}
