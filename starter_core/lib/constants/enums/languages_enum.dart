// Language codes kept local to starter_core so the core package stays free of
// app-level constants (AppConstants lives in the app / UI layer).
const String kLangEn = 'en';
const String kLangAr = 'ar';

enum LanguagesEnum { english, arabic }

LanguagesEnum mapStringToLanguagesEnum(String language) {
  if (language == kLangEn) return LanguagesEnum.english;
  if (language == kLangAr) return LanguagesEnum.arabic;

  /// Fallback
  return LanguagesEnum.english;
}

String mapLanguageEnumToString(LanguagesEnum language) {
  switch (language) {
    case LanguagesEnum.english:
      return kLangEn;
    case LanguagesEnum.arabic:
      return kLangAr;
  }
}
