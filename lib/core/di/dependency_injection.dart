import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:text_to_spech/core/networking/api_service.dart';
import 'package:text_to_spech/core/networking/dio_factory.dart';
import 'package:text_to_spech/features/home/data/repos/text_to_spech_repo.dart';
import 'package:text_to_spech/features/home/logic/cubit/text_to_spach_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetit() async {
  Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Text To Spech
  getIt.registerLazySingleton<TextToSpechRepo>(() => TextToSpechRepo(getIt()));
  getIt.registerFactory<TextToSpachCubit>(() => TextToSpachCubit(getIt()));
}
