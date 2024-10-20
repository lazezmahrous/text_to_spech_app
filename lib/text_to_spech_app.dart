import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_to_spech/core/routing/routers.dart';
import 'core/language/cubit/language_cubit.dart';
import 'core/routing/app_router.dart';
import 'core/theming/colors.dart';
import 'generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextToSpechApp extends StatefulWidget {
  const TextToSpechApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  State<TextToSpechApp> createState() => _TextToSpechAppState();
}

class _TextToSpechAppState extends State<TextToSpechApp> {
  bool? _isUserOpenApp;

  @override
  void initState() {
    super.initState();

    _checkUserOpenApp();
  }

  Future<void> _checkUserOpenApp() async {
    final prefs = await SharedPreferences.getInstance();
    final isOpen = prefs.getBool('onBoardingSeen') ?? false;
    setState(() {
      _isUserOpenApp = isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isUserOpenApp == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return BlocProvider(
      create: (context) => LanguageCubit()..getSavedLanguage(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return BlocBuilder<LanguageCubit, LanguageState>(
              builder: (context, state) {
            return state.when(
              initial: () {
                return buildMaterialApp(context, const Locale('en'));
              },
              getLanguage: (language) {
                return buildMaterialApp(context, language);
              },
            );
          });
        },
      ),
    );
  }

  Widget buildMaterialApp(BuildContext context, Locale locale) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo',
        primaryColor: ColorsManager.mainBlue,
      ),
      locale: locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute:
          _isUserOpenApp! ? Routes.homeScreen : Routes.onBoardingScreen,
      onGenerateRoute: widget.appRouter.generateRoute,
    );
  }
}
