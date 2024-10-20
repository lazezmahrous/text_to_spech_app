import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';
import '../../logic/cubit/text_to_spach_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectLanguageWidget extends StatefulWidget {
  const SelectLanguageWidget({super.key});
  @override
  State<SelectLanguageWidget> createState() => _SelectLanguageWidgetState();
}

class _SelectLanguageWidgetState extends State<SelectLanguageWidget> {
 
  final Map<String, String> languages = {
    'af': 'Afrikaans',
    'sq': 'Albanian',
    'ar': 'Arabic',
    'hy': 'Armenian',
    'bn': 'Bengali',
    'bs': 'Bosnian',
    'ca': 'Catalan',
    'hr': 'Croatian',
    'cs': 'Czech',
    'da': 'Danish',
    'nl': 'Dutch',
    'en': 'English',
    'et': 'Estonian',
    'tl': 'Filipino',
    'fi': 'Finnish',
    'fr': 'French',
    'de': 'German',
    'el': 'Greek',
    'en-us': 'English (US)',
    'gu': 'Gujarati',
    'hi': 'Hindi',
    'hu': 'Hungarian',
    'is': 'Icelandic',
    'id': 'Indonesian',
    'it': 'Italian',
    'ja': 'Japanese',
    'en-ca': 'English (Canada)',
    'jw': 'Javanese',
    'kn': 'Kannada',
    'km': 'Khmer',
    'ko': 'Korean',
    'la': 'Latin',
    'lv': 'Latvian',
    'mk': 'Macedonian',
    'ml': 'Malayalam',
    'mr': 'Marathi',
    'en-in': 'English (India)',
  };

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: context.read<TextToSpachCubit>().languageCode,
      decoration: InputDecoration(
        labelText: S.of(context).homeSelectLanguageHintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
      ),
      items: languages.entries.map((entry) {
        return DropdownMenuItem<String>(
          value: entry.key,
          child: Text(entry.value),
        );
      }).toList(),
      onChanged: (value) {
        context.read<TextToSpachCubit>().languageCode = value!;
        setState(() {});
      },
    );
  }
}
