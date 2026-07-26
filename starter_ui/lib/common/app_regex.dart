class AppRegex {
  static final RegExp emailRegex = RegExp(r'^[\w.-]+@[a-zA-Z\d.-]+\.[a-zA-Z]{2,}$');
  static final RegExp phoneRegex = RegExp(r'^[0-9]+$');
  static final RegExp passwordRegex = RegExp(r'^.{8,}$');

  /// Non-blank check (rejects empty/whitespace-only strings) — used for
  /// free-text name-style fields that don't need a stricter format.
  static final RegExp nameRegex = RegExp(r'^(?!\s*$).+');
}
