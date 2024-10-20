import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_to_spech/core/helpers/extensions.dart';
import '../../../../core/language/cubit/language_cubit.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final String _selectedLanguage = 'en';

  final List<Map<String, String>> _languages = [
    {'code': 'en', 'name': 'English'},
    {'code': 'ar', 'name': 'العربية'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          context.pop();
        },
      )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).homeSelectLanguageHintText,
                  style: TextStyles.font12DarkBlueRegular,
                ),
                DropdownButton<String>(
                  isDense: false,
                  elevation: 0,
                  value: _selectedLanguage,
                  icon: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_drop_down),
                  ),
                  items: _languages.map((language) {
                    return DropdownMenuItem<String>(
                      value: language['code'],
                      child: Text(language['name']!),
                    );
                  }).toList(),
                  onChanged: (language) =>
                      context.read<LanguageCubit>().changeLanguage(language!),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
