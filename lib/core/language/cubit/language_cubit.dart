import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_state.dart';
part 'language_cubit.freezed.dart';

enum Language {
  ar,

  en,
}

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(const LanguageState.initial());

  Future<String> getSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();

    final savedLanguage = prefs.getString('language');

    if (savedLanguage == null) {
      await prefs.setString('language', 'en');

      return prefs.getString('language').toString();
    } else {
      if (savedLanguage == 'en') {
        emit(const LanguageState.getLanguage(local: Locale('en')));

        return savedLanguage;
      } else {
        emit(const LanguageState.getLanguage(local: Locale('ar')));

        return savedLanguage;
      }
    }
  }

  void changeLanguage(String language) async {
    print('language: $language');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);

    final savedLanguage = prefs.getString('language');
    emit(LanguageState.getLanguage(local: Locale(savedLanguage!)));
  }
}
