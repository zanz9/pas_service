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

  /// `Система оценки персонала`
  String get home {
    return Intl.message(
      'Система оценки персонала',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Сортировка по:`
  String get sortBy {
    return Intl.message(
      'Сортировка по:',
      name: 'sortBy',
      desc: '',
      args: [],
    );
  }

  /// `Профессиональные`
  String get sortBy_professional {
    return Intl.message(
      'Профессиональные',
      name: 'sortBy_professional',
      desc: '',
      args: [],
    );
  }

  /// `Личностные`
  String get sortBy_personal {
    return Intl.message(
      'Личностные',
      name: 'sortBy_personal',
      desc: '',
      args: [],
    );
  }

  /// `Деловые`
  String get sortBy_business {
    return Intl.message(
      'Деловые',
      name: 'sortBy_business',
      desc: '',
      args: [],
    );
  }

  /// `Интегральные`
  String get sortBy_integral {
    return Intl.message(
      'Интегральные',
      name: 'sortBy_integral',
      desc: '',
      args: [],
    );
  }

  /// `Уже подана заявка на оценку`
  String get profile_stateTrue {
    return Intl.message(
      'Уже подана заявка на оценку',
      name: 'profile_stateTrue',
      desc: '',
      args: [],
    );
  }

  /// `Не подана заявка на оценку`
  String get profile_stateFalse {
    return Intl.message(
      'Не подана заявка на оценку',
      name: 'profile_stateFalse',
      desc: '',
      args: [],
    );
  }

  /// `Подать заявку на оценку`
  String get profile_onClickState {
    return Intl.message(
      'Подать заявку на оценку',
      name: 'profile_onClickState',
      desc: '',
      args: [],
    );
  }

  /// `Страница пользователя`
  String get user {
    return Intl.message(
      'Страница пользователя',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Критерии оценки`
  String get user_criteria {
    return Intl.message(
      'Критерии оценки',
      name: 'user_criteria',
      desc: '',
      args: [],
    );
  }

  /// `Профессиональные качества`
  String get user_professional {
    return Intl.message(
      'Профессиональные качества',
      name: 'user_professional',
      desc: '',
      args: [],
    );
  }

  /// `Знания`
  String get user_professional_knowledge {
    return Intl.message(
      'Знания',
      name: 'user_professional_knowledge',
      desc: '',
      args: [],
    );
  }

  /// `Умения`
  String get user_professional_ability {
    return Intl.message(
      'Умения',
      name: 'user_professional_ability',
      desc: '',
      args: [],
    );
  }

  /// `Навыки`
  String get user_professional_skills {
    return Intl.message(
      'Навыки',
      name: 'user_professional_skills',
      desc: '',
      args: [],
    );
  }

  /// `Профессиональный опыт`
  String get user_professional_experience {
    return Intl.message(
      'Профессиональный опыт',
      name: 'user_professional_experience',
      desc: '',
      args: [],
    );
  }

  /// `Квалификации`
  String get user_professional_qualifications {
    return Intl.message(
      'Квалификации',
      name: 'user_professional_qualifications',
      desc: '',
      args: [],
    );
  }

  /// `Результаты труда`
  String get user_professional_resultOfWork {
    return Intl.message(
      'Результаты труда',
      name: 'user_professional_resultOfWork',
      desc: '',
      args: [],
    );
  }

  /// `Личные качества`
  String get user_personal {
    return Intl.message(
      'Личные качества',
      name: 'user_personal',
      desc: '',
      args: [],
    );
  }

  /// `Способность к самооценке`
  String get user_personal_theAbilityToSelfEsteem {
    return Intl.message(
      'Способность к самооценке',
      name: 'user_personal_theAbilityToSelfEsteem',
      desc: '',
      args: [],
    );
  }

  /// `Нравственность`
  String get user_personal_morality {
    return Intl.message(
      'Нравственность',
      name: 'user_personal_morality',
      desc: '',
      args: [],
    );
  }

  /// `Честность`
  String get user_personal_honesty {
    return Intl.message(
      'Честность',
      name: 'user_personal_honesty',
      desc: '',
      args: [],
    );
  }

  /// `Справедливость`
  String get user_personal_justice {
    return Intl.message(
      'Справедливость',
      name: 'user_personal_justice',
      desc: '',
      args: [],
    );
  }

  /// `Психологическая устойчивость`
  String get user_personal_psychologicalStability {
    return Intl.message(
      'Психологическая устойчивость',
      name: 'user_personal_psychologicalStability',
      desc: '',
      args: [],
    );
  }

  /// `Деловые качества`
  String get user_business {
    return Intl.message(
      'Деловые качества',
      name: 'user_business',
      desc: '',
      args: [],
    );
  }

  /// `Организованность`
  String get user_business_organization {
    return Intl.message(
      'Организованность',
      name: 'user_business_organization',
      desc: '',
      args: [],
    );
  }

  /// `Ответственность`
  String get user_business_responsibility {
    return Intl.message(
      'Ответственность',
      name: 'user_business_responsibility',
      desc: '',
      args: [],
    );
  }

  /// `Инициативность`
  String get user_business_initiative {
    return Intl.message(
      'Инициативность',
      name: 'user_business_initiative',
      desc: '',
      args: [],
    );
  }

  /// `Предприимчивость`
  String get user_business_enterprise {
    return Intl.message(
      'Предприимчивость',
      name: 'user_business_enterprise',
      desc: '',
      args: [],
    );
  }

  /// `Интегральные качества`
  String get user_integral {
    return Intl.message(
      'Интегральные качества',
      name: 'user_integral',
      desc: '',
      args: [],
    );
  }

  /// `Авторитет`
  String get user_integral_authority {
    return Intl.message(
      'Авторитет',
      name: 'user_integral_authority',
      desc: '',
      args: [],
    );
  }

  /// `Культура`
  String get user_integral_culture {
    return Intl.message(
      'Культура',
      name: 'user_integral_culture',
      desc: '',
      args: [],
    );
  }

  /// `Мышление`
  String get user_integral_thinking {
    return Intl.message(
      'Мышление',
      name: 'user_integral_thinking',
      desc: '',
      args: [],
    );
  }

  /// `Речь`
  String get user_integral_speech {
    return Intl.message(
      'Речь',
      name: 'user_integral_speech',
      desc: '',
      args: [],
    );
  }

  /// `Начать оценку`
  String get user_start {
    return Intl.message(
      'Начать оценку',
      name: 'user_start',
      desc: '',
      args: [],
    );
  }

  /// `У пользователя пройдена проверка оценки`
  String get user_cantStart {
    return Intl.message(
      'У пользователя пройдена проверка оценки',
      name: 'user_cantStart',
      desc: '',
      args: [],
    );
  }

  /// `Оценка пользователя`
  String get user_validate {
    return Intl.message(
      'Оценка пользователя',
      name: 'user_validate',
      desc: '',
      args: [],
    );
  }

  /// `Критерий оценки`
  String get user_validate_subHeader {
    return Intl.message(
      'Критерий оценки',
      name: 'user_validate_subHeader',
      desc: '',
      args: [],
    );
  }

  /// `Авторизация`
  String get loginTitle {
    return Intl.message(
      'Авторизация',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Войти`
  String get onLogin {
    return Intl.message(
      'Войти',
      name: 'onLogin',
      desc: '',
      args: [],
    );
  }

  /// `Нет аккаунта? Зарегистроваться`
  String get dontHaveAccount {
    return Intl.message(
      'Нет аккаунта? Зарегистроваться',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Регистрация`
  String get registerTitle {
    return Intl.message(
      'Регистрация',
      name: 'registerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Зарегистрироваться`
  String get onRegister {
    return Intl.message(
      'Зарегистрироваться',
      name: 'onRegister',
      desc: '',
      args: [],
    );
  }

  /// `Уже есть аккаунт? Войти`
  String get haveAccount {
    return Intl.message(
      'Уже есть аккаунт? Войти',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Почта`
  String get email {
    return Intl.message(
      'Почта',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Пароль`
  String get password {
    return Intl.message(
      'Пароль',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Имя`
  String get firstName {
    return Intl.message(
      'Имя',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Фамилия`
  String get lastName {
    return Intl.message(
      'Фамилия',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Пользователь не найден`
  String get auth_not_found {
    return Intl.message(
      'Пользователь не найден',
      name: 'auth_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Неверные данные для входа`
  String get auth_invalid {
    return Intl.message(
      'Неверные данные для входа',
      name: 'auth_invalid',
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
      Locale.fromSubtags(languageCode: 'ru'),
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
