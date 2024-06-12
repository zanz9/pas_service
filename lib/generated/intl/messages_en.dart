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
        "auth_invalid":
            MessageLookupByLibrary.simpleMessage("Неверные данные для входа"),
        "auth_not_found":
            MessageLookupByLibrary.simpleMessage("Пользователь не найден"),
        "dontHaveAccount": MessageLookupByLibrary.simpleMessage(
            "Нет аккаунта? Зарегистроваться"),
        "email": MessageLookupByLibrary.simpleMessage("Почта"),
        "firstName": MessageLookupByLibrary.simpleMessage("Имя"),
        "haveAccount":
            MessageLookupByLibrary.simpleMessage("Уже есть аккаунт? Войти"),
        "home":
            MessageLookupByLibrary.simpleMessage("Система оценки персонала"),
        "lastName": MessageLookupByLibrary.simpleMessage("Фамилия"),
        "loginTitle": MessageLookupByLibrary.simpleMessage("Авторизация"),
        "onLogin": MessageLookupByLibrary.simpleMessage("Войти"),
        "onRegister":
            MessageLookupByLibrary.simpleMessage("Зарегистрироваться"),
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "profile_onClickState":
            MessageLookupByLibrary.simpleMessage("Подать заявку на оценку"),
        "profile_stateFalse":
            MessageLookupByLibrary.simpleMessage("Не подана заявка на оценку"),
        "profile_stateTrue":
            MessageLookupByLibrary.simpleMessage("Уже подана заявка на оценку"),
        "registerTitle": MessageLookupByLibrary.simpleMessage("Регистрация"),
        "sortBy": MessageLookupByLibrary.simpleMessage("Сортировка по:"),
        "sortBy_business": MessageLookupByLibrary.simpleMessage("Деловые"),
        "sortBy_integral": MessageLookupByLibrary.simpleMessage("Интегральные"),
        "sortBy_personal": MessageLookupByLibrary.simpleMessage("Личностные"),
        "sortBy_professional":
            MessageLookupByLibrary.simpleMessage("Профессиональные"),
        "user": MessageLookupByLibrary.simpleMessage("Страница пользователя"),
        "user_business":
            MessageLookupByLibrary.simpleMessage("Деловые качества"),
        "user_business_enterprise":
            MessageLookupByLibrary.simpleMessage("Предприимчивость"),
        "user_business_initiative":
            MessageLookupByLibrary.simpleMessage("Инициативность"),
        "user_business_organization":
            MessageLookupByLibrary.simpleMessage("Организованность"),
        "user_business_responsibility":
            MessageLookupByLibrary.simpleMessage("Ответственность"),
        "user_cantStart": MessageLookupByLibrary.simpleMessage(
            "У пользователя пройдена проверка оценки"),
        "user_criteria":
            MessageLookupByLibrary.simpleMessage("Критерии оценки"),
        "user_integral":
            MessageLookupByLibrary.simpleMessage("Интегральные качества"),
        "user_integral_authority":
            MessageLookupByLibrary.simpleMessage("Авторитет"),
        "user_integral_culture":
            MessageLookupByLibrary.simpleMessage("Культура"),
        "user_integral_speech": MessageLookupByLibrary.simpleMessage("Речь"),
        "user_integral_thinking":
            MessageLookupByLibrary.simpleMessage("Мышление"),
        "user_personal":
            MessageLookupByLibrary.simpleMessage("Личные качества"),
        "user_personal_honesty":
            MessageLookupByLibrary.simpleMessage("Честность"),
        "user_personal_justice":
            MessageLookupByLibrary.simpleMessage("Справедливость"),
        "user_personal_morality":
            MessageLookupByLibrary.simpleMessage("Нравственность"),
        "user_personal_psychologicalStability":
            MessageLookupByLibrary.simpleMessage(
                "Психологическая устойчивость"),
        "user_personal_theAbilityToSelfEsteem":
            MessageLookupByLibrary.simpleMessage("Способность к самооценке"),
        "user_professional":
            MessageLookupByLibrary.simpleMessage("Профессиональные качества"),
        "user_professional_ability":
            MessageLookupByLibrary.simpleMessage("Умения"),
        "user_professional_experience":
            MessageLookupByLibrary.simpleMessage("Профессиональный опыт"),
        "user_professional_knowledge":
            MessageLookupByLibrary.simpleMessage("Знания"),
        "user_professional_qualifications":
            MessageLookupByLibrary.simpleMessage("Квалификации"),
        "user_professional_resultOfWork":
            MessageLookupByLibrary.simpleMessage("Результаты труда"),
        "user_professional_skills":
            MessageLookupByLibrary.simpleMessage("Навыки"),
        "user_start": MessageLookupByLibrary.simpleMessage("Начать оценку"),
        "user_validate":
            MessageLookupByLibrary.simpleMessage("Оценка пользователя"),
        "user_validate_subHeader":
            MessageLookupByLibrary.simpleMessage("Критерий оценки")
      };
}
