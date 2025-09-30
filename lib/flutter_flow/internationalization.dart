import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi', 'pa'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
    String? paText = '',
  }) =>
      [enText, hiText, paText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '9cu5isv9': {
      'en': 'Krishi Sahyog',
      'hi': 'कृषि सहयोग',
      'pa': 'ਕ੍ਰਿਸ਼ੀ ਸਹਿਯੋਗ',
    },
    '1ieitf1k': {
      'en': 'Empowering Every Farmer with Smart Technology',
      'hi': 'प्रत्येक किसान को स्मार्ट प्रौद्योगिकी से सशक्त बनाना',
      'pa': 'ਸਮਾਰਟ ਟੈਕਨਾਲੋਜੀ ਨਾਲ ਹਰ ਕਿਸਾਨ ਨੂੰ ਸ਼ਕਤੀ ਪ੍ਰਦਾਨ ਕਰਨਾ',
    },
    'sdu1pv5m': {
      'en': 'Next',
      'hi': 'अगला',
      'pa': 'ਅਗਲਾ',
    },
    'm4936rui': {
      'en': 'Select language/ भाषा चुने/ਭਾਸ਼ਾ ਚੁਣੋ',
      'hi': 'Select language/ भाषा चुने/ਭਾਸ਼ਾ ਚੁਣੋ',
      'pa': 'Select language/ भाषा चुने/ਭਾਸ਼ਾ ਚੁਣੋ',
    },
    '9ouynkg4': {
      'en': 'Home',
      'hi': 'घर',
      'pa': 'ਘਰ',
    },
  },
  // ResetPassword
  {
    '5giu84x2': {
      'en': 'Forgot password',
      'hi': 'पासवर्ड भूल गए',
      'pa': 'ਪਾਸਵਰਡ ਭੁੱਲ ਗਏ',
    },
    'sig5mlup': {
      'en': 'Your Number',
      'hi': 'आपका फोन नंबर',
      'pa': 'ਤੁਹਾਡਾ ਨੰਬਰ',
    },
    '8ur7op3b': {
      'en': '1234567890',
      'hi': '1234567890',
      'pa': '1234567890',
    },
    '3zgd6fyd': {
      'en': 'Send OTP',
      'hi': 'ओटीपी भेजें',
      'pa': 'OTP ਭੇਜੋ',
    },
    'p5l028by': {
      'en': 'Please enter your phone number to reset the password',
      'hi': 'पासवर्ड रीसेट करने के लिए कृपया अपना फ़ोन नंबर दर्ज करें',
      'pa': 'ਕਿਰਪਾ ਕਰਕੇ ਪਾਸਵਰਡ ਰੀਸੈਟ ਕਰਨ ਲਈ ਆਪਣਾ ਫ਼ੋਨ ਨੰਬਰ ਦਾਖਲ ਕਰੋ',
    },
    '1tw3tocz': {
      'en': 'Home',
      'hi': 'घर',
      'pa': 'ਘਰ',
    },
  },
  // LoginPage
  {
    'v9e2yex1': {
      'en': 'Log in',
      'hi': 'लॉग इन करें',
      'pa': 'ਲੌਗ ਇਨ',
    },
    'q3ljg4am': {
      'en': 'Your Number',
      'hi': 'आपका फोन नंबर',
      'pa': 'ਤੁਹਾਡਾ ਨੰਬਰ',
    },
    'bwsbnv1e': {
      'en': '1234567890',
      'hi': '1234567890',
      'pa': '1234567890',
    },
    'p15u3aj8': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'pa': 'ਪਾਸਵਰਡ',
    },
    'ifu2ja2x': {
      'en': '******',
      'hi': '******',
      'pa': '******',
    },
    '60dsi5lr': {
      'en': 'Forgot Password ?',
      'hi': 'पासवर्ड भूल गए?',
      'pa': 'ਪਾਸਵਰਡ ਭੁੱਲ ਗਏ ?',
    },
    'ps92b3z6': {
      'en': 'Log in',
      'hi': 'लॉग इन करें',
      'pa': 'ਲੌਗ ਇਨ',
    },
    'dxocg9i0': {
      'en': 'Or',
      'hi': 'या',
      'pa': 'ਜਾਂ',
    },
    'h5de61on': {
      'en': 'Log in with google',
      'hi': 'गूगल से लॉग इन करें',
      'pa': 'ਗੂਗਲ ਨਾਲ ਲੌਗ ਇਨ ਕਰੋ',
    },
    'swv50f1e': {
      'en': 'Sign up',
      'hi': 'साइन अप करें',
      'pa': 'ਸਾਇਨ ਅਪ',
    },
    '492j54ol': {
      'en': 'Your Number',
      'hi': 'आपका फोन नंबर',
      'pa': 'ਤੁਹਾਡਾ ਨੰਬਰ',
    },
    'n04lwr2q': {
      'en': '1234567890',
      'hi': '',
      'pa': '',
    },
    '0iatleh9': {
      'en': 'Create Password',
      'hi': 'पासवर्ड बनाएं',
      'pa': 'ਪਾਸਵਰਡ ਬਣਾਓ',
    },
    'dwixrf5f': {
      'en': 'Enter your Password.....',
      'hi': 'अपना पासवर्ड  भरें.....',
      'pa': 'ਆਪਣਾ ਪਾਸਵਰਡ ਦਰਜ ਕਰੋ.....',
    },
    'xyuszdof': {
      'en': 'Sign up',
      'hi': 'लॉग इन करें',
      'pa': 'ਲੌਗ ਇਨ',
    },
    '96ds251y': {
      'en': 'Or',
      'hi': 'या',
      'pa': 'ਜਾਂ',
    },
    'wvkvyapg': {
      'en': 'Log in with google',
      'hi': 'गूगल से लॉग इन करें',
      'pa': 'ਗੂਗਲ ਨਾਲ ਲੌਗ ਇਨ ਕਰੋ',
    },
    '4nd4fzng': {
      'en': 'Home',
      'hi': 'घर',
      'pa': 'ਘਰ',
    },
  },
  // Dashboard
  {
    '3weng8z6': {
      'en': 'Flush toh kar leta bhai',
      'hi': 'फ्लश तो कर लेता भाई',
      'pa': 'ਫਲੱਸ਼ ਤੋ ਕਰ ਲੇਟਾ ਭਾਈ',
    },
    'k5eblcqs': {
      'en': 'log out',
      'hi': 'लॉग आउट',
      'pa': 'ਲਾਗ ਆਊਟ ਕਰੋ',
    },
    'rsfu7077': {
      'en': 'Home',
      'hi': 'घर',
      'pa': 'ਘਰ',
    },
  },
  // Miscellaneous
  {
    '8e1qs3ng': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'e8wc7sli': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'nyc4gyia': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    '87ghtkz2': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'vnz4pe7a': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'v6lqzqy3': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'yviqczf5': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'dut1xwtc': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'pkikhtpg': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    '4y8xrkup': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    '4alixwua': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    '79b9pssz': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    '8w6hcr8s': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'pj57xfl1': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    '9teylzos': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'mbtvjee7': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    '4um4r5yz': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    '5wdrpouw': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'beu0jfet': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'e73f4jdy': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    '1g0rlbkp': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    '32wl5zo2': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    '0z5mqcd7': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    '7ncfnbus': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'y4iwhg3k': {
      'en': '',
      'hi': '',
      'pa': '',
    },
  },
].reduce((a, b) => a..addAll(b));
