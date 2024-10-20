// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "homeButtonTitle": MessageLookupByLibrary.simpleMessage("Convert"),
        "homeHederTitle":
            MessageLookupByLibrary.simpleMessage("Welcome To TTS ✨"),
        "homeSelectLanguageHintText":
            MessageLookupByLibrary.simpleMessage("Select Language"),
        "homeTextFieldHitntText":
            MessageLookupByLibrary.simpleMessage("Enter Text"),
        "homeTextFieldValidatorOnlyLetters":
            MessageLookupByLibrary.simpleMessage("Please Enter Only Letters"),
        "homeTextFieldValidatorTextIsEmpty":
            MessageLookupByLibrary.simpleMessage("Please Enter Text"),
        "onBoardingButtonTitle":
            MessageLookupByLibrary.simpleMessage("Get Started"),
        "onBoardingDescription": MessageLookupByLibrary.simpleMessage(
            "A **Text-to-Speech (TTS) application** allows users to input text and convert it into spoken words using voice synthesis. The app provides options to select different languages and voices. It can be used for various purposes, such as improving accessibility for visually impaired users, assisting with language learning, or converting written content into audio format. With a simple interface, users can type or paste text, choose their desired language, and generate an audio file, which can be played immediately or saved for later use.")
      };
}
