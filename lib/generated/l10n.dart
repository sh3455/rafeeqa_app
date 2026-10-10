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

  /// `Rafeeqa`
  String get appName {
    return Intl.message(
      'Rafeeqa',
      name: 'appName',
      desc: 'The name of the app',
      args: [],
    );
  }

  /// `Understand your baby`
  String get onboardingTitle1 {
    return Intl.message(
      'Understand your baby',
      name: 'onboardingTitle1',
      desc: 'Onboarding screen 1 - title',
      args: [],
    );
  }

  /// `Learn what your baby needs, from feeding to sleep, and feel more confident every day.`
  String get onboardingDescription1 {
    return Intl.message(
      'Learn what your baby needs, from feeding to sleep, and feel more confident every day.',
      name: 'onboardingDescription1',
      desc: 'Onboarding screen 1 - description',
      args: [],
    );
  }

  /// `Track every moment`
  String get onboardingTitle2 {
    return Intl.message(
      'Track every moment',
      name: 'onboardingTitle2',
      desc: 'Onboarding screen 2 - title',
      args: [],
    );
  }

  /// `Keep a simple journal of daily activities and never miss an important milestone.`
  String get onboardingDescription2 {
    return Intl.message(
      'Keep a simple journal of daily activities and never miss an important milestone.',
      name: 'onboardingDescription2',
      desc: 'Onboarding screen 2 - description',
      args: [],
    );
  }

  /// `Ask Rafeeqa`
  String get onboardingTitle3 {
    return Intl.message(
      'Ask Rafeeqa',
      name: 'onboardingTitle3',
      desc: 'Onboarding screen 3 - title',
      args: [],
    );
  }

  /// `Get instant answers to your questions, anytime, in a kind and supportive way.`
  String get onboardingDescription3 {
    return Intl.message(
      'Get instant answers to your questions, anytime, in a kind and supportive way.',
      name: 'onboardingDescription3',
      desc: 'Onboarding screen 3 - description',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: 'Next button label',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: 'Get Started button label (last onboarding screen)',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: 'Skip button label',
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
