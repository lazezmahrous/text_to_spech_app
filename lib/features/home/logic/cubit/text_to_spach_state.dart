part of 'text_to_spach_cubit.dart';

@freezed
class TextToSpachState<T> with _$TextToSpachState<T> {
  const factory TextToSpachState.initial() = _Initial;
  const factory TextToSpachState.loading() = Loading;
  const factory TextToSpachState.success({required TextToSpechResponse? data}) = Success<T>;
  const factory TextToSpachState.error({required String error}) = Error<T>;
}
