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

class CoreS {
  CoreS();

  static CoreS? _current;

  static CoreS get current {
    assert(
      _current != null,
      'No instance of CoreS was loaded. Try to initialize the CoreS delegate before accessing CoreS.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<CoreS> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = CoreS();
      CoreS._current = instance;

      return instance;
    });
  }

  static CoreS of(BuildContext context) {
    final instance = CoreS.maybeOf(context);
    assert(
      instance != null,
      'No instance of CoreS present in the widget tree. Did you add CoreS.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static CoreS? maybeOf(BuildContext context) {
    return Localizations.of<CoreS>(context, CoreS);
  }

  /// `Error Occured 😢`
  String get errorOccurred {
    return Intl.message(
      'Error Occured 😢',
      name: 'errorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized`
  String get unauthorized {
    return Intl.message(
      'Unauthorized',
      name: 'unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `An error has occurred. Please try again later`
  String get generalErrorMessage {
    return Intl.message(
      'An error has occurred. Please try again later',
      name: 'generalErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Bad Request`
  String get badRequest {
    return Intl.message('Bad Request', name: 'badRequest', desc: '', args: []);
  }

  /// `Forbidden`
  String get forbidden {
    return Intl.message('Forbidden', name: 'forbidden', desc: '', args: []);
  }

  /// `{url} not Found`
  String notFound(Object url) {
    return Intl.message(
      '$url not Found',
      name: 'notFound',
      desc: '',
      args: [url],
    );
  }

  /// `Conflict Error`
  String get conflictError {
    return Intl.message(
      'Conflict Error',
      name: 'conflictError',
      desc: '',
      args: [],
    );
  }

  /// `Connection time out`
  String get connectionTimeOut {
    return Intl.message(
      'Connection time out',
      name: 'connectionTimeOut',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error occurred, please try again`
  String get unknownError {
    return Intl.message(
      'Unknown error occurred, please try again',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `The server encountered an internal error or misconfigurtion and was unable to complete your request.`
  String get internalServerErrorMessage {
    return Intl.message(
      'The server encountered an internal error or misconfigurtion and was unable to complete your request.',
      name: 'internalServerErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection`
  String get connectionErrorMessage {
    return Intl.message(
      'Please check your internet connection',
      name: 'connectionErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `OOPS !`
  String get oopsErrorMessage {
    return Intl.message('OOPS !', name: 'oopsErrorMessage', desc: '', args: []);
  }

  /// `Failed to get data`
  String get failedRefresher {
    return Intl.message(
      'Failed to get data',
      name: 'failedRefresher',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get noDataRefresher {
    return Intl.message('No data', name: 'noDataRefresher', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Select a language, the application will restart`
  String get changeLangMessage {
    return Intl.message(
      'Select a language, the application will restart',
      name: 'changeLangMessage',
      desc: '',
      args: [],
    );
  }

  /// `Press twice to exit`
  String get pressTwiceToExit {
    return Intl.message(
      'Press twice to exit',
      name: 'pressTwiceToExit',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Close App`
  String get closeApp {
    return Intl.message('Close App', name: 'closeApp', desc: '', args: []);
  }

  /// `Refresh`
  String get refresh {
    return Intl.message('Refresh', name: 'refresh', desc: '', args: []);
  }

  /// `An error happened while connecting to server, please try again later`
  String get responseError {
    return Intl.message(
      'An error happened while connecting to server, please try again later',
      name: 'responseError',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message('Ok', name: 'ok', desc: '', args: []);
  }

  /// `This field mustn't be empty`
  String get errorEmptyField {
    return Intl.message(
      'This field mustn\'t be empty',
      name: 'errorEmptyField',
      desc: '',
      args: [],
    );
  }

  /// `Account Not Verified`
  String get accountNotVerifiedErrorMessage {
    return Intl.message(
      'Account Not Verified',
      name: 'accountNotVerifiedErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Operation has been cancelled`
  String get cancelErrorMessage {
    return Intl.message(
      'Operation has been cancelled',
      name: 'cancelErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `login Error Required`
  String get loginErrorRequired {
    return Intl.message(
      'login Error Required',
      name: 'loginErrorRequired',
      desc: '',
      args: [],
    );
  }

  /// `This page is empty`
  String get emptyScreen {
    return Intl.message(
      'This page is empty',
      name: 'emptyScreen',
      desc: '',
      args: [],
    );
  }

  /// `Couldn't find path`
  String get mapPathError {
    return Intl.message(
      'Couldn\'t find path',
      name: 'mapPathError',
      desc: '',
      args: [],
    );
  }

  /// `Could not fetch distance`
  String get errorFetchDistance {
    return Intl.message(
      'Could not fetch distance',
      name: 'errorFetchDistance',
      desc: '',
      args: [],
    );
  }

  /// `OTP Verification`
  String get otpVerification {
    return Intl.message(
      'OTP Verification',
      name: 'otpVerification',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resendCode {
    return Intl.message('Resend Code', name: 'resendCode', desc: '', args: []);
  }

  /// `No Result Found`
  String get noResultFound {
    return Intl.message(
      'No Result Found',
      name: 'noResultFound',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Sorry, you are a guest, login to continue.`
  String get guetsMessage {
    return Intl.message(
      'Sorry, you are a guest, login to continue.',
      name: 'guetsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Update Required`
  String get dialogUpdateTitle {
    return Intl.message(
      'Update Required',
      name: 'dialogUpdateTitle',
      desc: '',
      args: [],
    );
  }

  /// `New Update!`
  String get optionalUpdateTitle {
    return Intl.message(
      'New Update!',
      name: 'optionalUpdateTitle',
      desc: '',
      args: [],
    );
  }

  /// `For the best experience, update to the latest version to get new features and improvements.`
  String get dialogUpdateMessage {
    return Intl.message(
      'For the best experience, update to the latest version to get new features and improvements.',
      name: 'dialogUpdateMessage',
      desc: '',
      args: [],
    );
  }

  /// `There is a new version for this app. Update to get new features and improvements`
  String get optionalUpdateMessage {
    return Intl.message(
      'There is a new version for this app. Update to get new features and improvements',
      name: 'optionalUpdateMessage',
      desc: '',
      args: [],
    );
  }

  /// `Ignore`
  String get ignoreForNow {
    return Intl.message('Ignore', name: 'ignoreForNow', desc: '', args: []);
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
  }

  /// `Access Denied!`
  String get accessDenied {
    return Intl.message(
      'Access Denied!',
      name: 'accessDenied',
      desc: '',
      args: [],
    );
  }

  /// `{permissionName} permission required!`
  String specificPermissionRequired(Object permissionName) {
    return Intl.message(
      '$permissionName permission required!',
      name: 'specificPermissionRequired',
      desc: '',
      args: [permissionName],
    );
  }

  /// `Make sure {permissionName} permission is granted to be able to use the app.`
  String makeSureSpecificPermissionGranted(Object permissionName) {
    return Intl.message(
      'Make sure $permissionName permission is granted to be able to use the app.',
      name: 'makeSureSpecificPermissionGranted',
      desc: '',
      args: [permissionName],
    );
  }

  /// `Try enabling it from your phone settings`
  String get tryEnablingItFromYourPhoneSettings {
    return Intl.message(
      'Try enabling it from your phone settings',
      name: 'tryEnablingItFromYourPhoneSettings',
      desc: '',
      args: [],
    );
  }

  /// `Open App Settings`
  String get openAppSettings {
    return Intl.message(
      'Open App Settings',
      name: 'openAppSettings',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get locationPermission {
    return Intl.message(
      'Location',
      name: 'locationPermission',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get cameraPermission {
    return Intl.message('Camera', name: 'cameraPermission', desc: '', args: []);
  }

  /// `The previous permission is required!`
  String get permissionRequiredTitle {
    return Intl.message(
      'The previous permission is required!',
      name: 'permissionRequiredTitle',
      desc: '',
      args: [],
    );
  }

  /// `make sure to grant the previous permission to be able to use the app.`
  String get permissionRequiredMessage {
    return Intl.message(
      'make sure to grant the previous permission to be able to use the app.',
      name: 'permissionRequiredMessage',
      desc: '',
      args: [],
    );
  }

  /// `Didn't you receive any code?`
  String get didnotReceiveAnyCode {
    return Intl.message(
      'Didn\'t you receive any code?',
      name: 'didnotReceiveAnyCode',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get thisFieldIsRequired {
    return Intl.message(
      'This field is required',
      name: 'thisFieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `The min length should be more than`
  String get theMinLengthShouldBeMoreThan {
    return Intl.message(
      'The min length should be more than',
      name: 'theMinLengthShouldBeMoreThan',
      desc: '',
      args: [],
    );
  }

  /// `The max length should be less than`
  String get theMaxLengthShouldBeLessThan {
    return Intl.message(
      'The max length should be less than',
      name: 'theMaxLengthShouldBeLessThan',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address`
  String get invalidEmail {
    return Intl.message(
      'Invalid email address',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get invalidPhone {
    return Intl.message(
      'Invalid phone number',
      name: 'invalidPhone',
      desc: '',
      args: [],
    );
  }

  /// `Invalid password`
  String get invalidPassword {
    return Intl.message(
      'Invalid password',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<CoreS> {
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
  Future<CoreS> load(Locale locale) => CoreS.load(locale);
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
