import 'package:flutter/material.dart';
import 'package:text_to_spech/core/di/dependency_injection.dart';
import 'package:text_to_spech/core/routing/routers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_to_spech/features/home/logic/cubit/text_to_spach_cubit.dart';
import 'package:text_to_spech/features/settings/ui/screens/settings_screen.dart';
import '../../features/home/ui/screens/home_screen.dart';
import '../../features/on_boarding/ui/screen/on_boarding.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    print(settings.name);
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<TextToSpachCubit>(),
            child: const HomeScreen(),
          ),
        );
      case Routes.settingsScreen:
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
