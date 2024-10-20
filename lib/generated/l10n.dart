// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `A **Text-to-Speech (TTS) application** allows users to input text and convert it into spoken words using voice synthesis. The app provides options to select different languages and voices. It can be used for various purposes, such as improving accessibility for visually impaired users, assisting with language learning, or converting written content into audio format. With a simple interface, users can type or paste text, choose their desired language, and generate an audio file, which can be played immediately or saved for later use.`
  String get onBoardingDescription {
    return Intl.message(
      'A **Text-to-Speech (TTS) application** allows users to input text and convert it into spoken words using voice synthesis. The app provides options to select different languages and voices. It can be used for various purposes, such as improving accessibility for visually impaired users, assisting with language learning, or converting written content into audio format. With a simple interface, users can type or paste text, choose their desired language, and generate an audio file, which can be played immediately or saved for later use.',
      name: 'onBoardingDescription',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get onBoardingButtonTitle {
    return Intl.message(
      'Get Started',
      name: 'onBoardingButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome To TTS ✨`
  String get homeHederTitle {
    return Intl.message(
      'Welcome To TTS ✨',
      name: 'homeHederTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter Text`
  String get homeTextFieldHitntText {
    return Intl.message(
      'Enter Text',
      name: 'homeTextFieldHitntText',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Only Letters`
  String get homeTextFieldValidatorOnlyLetters {
    return Intl.message(
      'Please Enter Only Letters',
      name: 'homeTextFieldValidatorOnlyLetters',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Text`
  String get homeTextFieldValidatorTextIsEmpty {
    return Intl.message(
      'Please Enter Text',
      name: 'homeTextFieldValidatorTextIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get homeSelectLanguageHintText {
    return Intl.message(
      'Select Language',
      name: 'homeSelectLanguageHintText',
      desc: '',
      args: [],
    );
  }

  /// `Convert`
  String get homeButtonTitle {
    return Intl.message(
      'Convert',
      name: 'homeButtonTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
