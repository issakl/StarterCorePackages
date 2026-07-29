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

  static String m0(permissionName) =>
      "Make sure ${permissionName} permission is granted to be able to use the app.";

  static String m1(url) => "${url} not Found";

  static String m2(permissionName) => "${permissionName} permission required!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accessDenied": MessageLookupByLibrary.simpleMessage("Access Denied!"),
    "accountNotVerifiedErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Account Not Verified",
    ),
    "badRequest": MessageLookupByLibrary.simpleMessage("Bad Request"),
    "cameraPermission": MessageLookupByLibrary.simpleMessage("Camera"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cancelErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Operation has been cancelled",
    ),
    "changeLangMessage": MessageLookupByLibrary.simpleMessage(
      "Select a language, the application will restart",
    ),
    "closeApp": MessageLookupByLibrary.simpleMessage("Close App"),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "conflictError": MessageLookupByLibrary.simpleMessage("Conflict Error"),
    "connectionErrorMessage": MessageLookupByLibrary.simpleMessage(
      "Please check your internet connection",
    ),
    "connectionTimeOut": MessageLookupByLibrary.simpleMessage(
      "Connection time out",
    ),
    "dialogUpdateMessage": MessageLookupByLibrary.simpleMessage(
      "For the best experience, update to the latest version to get new features and improvements.",
    ),
    "dialogUpdateTitle": MessageLookupByLibrary.simpleMessage(
      "Update Required",
    ),
    "didnotReceiveAnyCode": MessageLookupByLibrary.simpleMessage(
      "Didn\'t you receive any code?",
    ),
    "emptyScreen": MessageLookupByLibrary.simpleMessage("This page is empty"),
    "errorEmptyField": MessageLookupByLibrary.simpleMessage(
      "This field mustn\'t be empty",
    ),
    "errorFetchDistance": MessageLookupByLibrary.simpleMessage(
      "Could not fetch distance",
    ),
    "errorOccurred": MessageLookupByLibrary.simpleMessage("Error Occured 😢"),
    "failedRefresher": MessageLookupByLibrary.simpleMessage(
      "Failed to get data",
    ),
    "forbidden": MessageLookupByLibrary.simpleMessage("Forbidden"),
    "generalErrorMessage": MessageLookupByLibrary.simpleMessage(
      "An error has occurred. Please try again later",
    ),
    "guetsMessage": MessageLookupByLibrary.simpleMessage(
      "Sorry, you are a guest, login to continue.",
    ),
    "ignoreForNow": MessageLookupByLibrary.simpleMessage("Ignore"),
    "internalServerErrorMessage": MessageLookupByLibrary.simpleMessage(
      "The server encountered an internal error or misconfigurtion and was unable to complete your request.",
    ),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "Invalid email address",
    ),
    "invalidPassword": MessageLookupByLibrary.simpleMessage("Invalid password"),
    "invalidPhone": MessageLookupByLibrary.simpleMessage(
      "Invalid phone number",
    ),
    "locationPermission": MessageLookupByLibrary.simpleMessage("Location"),
    "loginErrorRequired": MessageLookupByLibrary.simpleMessage(
      "login Error Required",
    ),
    "makeSureSpecificPermissionGranted": m0,
    "mapPathError": MessageLookupByLibrary.simpleMessage("Couldn\'t find path"),
    "noDataRefresher": MessageLookupByLibrary.simpleMessage("No data"),
    "noResultFound": MessageLookupByLibrary.simpleMessage("No Result Found"),
    "notFound": m1,
    "ok": MessageLookupByLibrary.simpleMessage("Ok"),
    "oopsErrorMessage": MessageLookupByLibrary.simpleMessage("OOPS !"),
    "openAppSettings": MessageLookupByLibrary.simpleMessage(
      "Open App Settings",
    ),
    "optionalUpdateMessage": MessageLookupByLibrary.simpleMessage(
      "There is a new version for this app. Update to get new features and improvements",
    ),
    "optionalUpdateTitle": MessageLookupByLibrary.simpleMessage("New Update!"),
    "otpVerification": MessageLookupByLibrary.simpleMessage("OTP Verification"),
    "permissionRequiredMessage": MessageLookupByLibrary.simpleMessage(
      "make sure to grant the previous permission to be able to use the app.",
    ),
    "permissionRequiredTitle": MessageLookupByLibrary.simpleMessage(
      "The previous permission is required!",
    ),
    "pressTwiceToExit": MessageLookupByLibrary.simpleMessage(
      "Press twice to exit",
    ),
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "resendCode": MessageLookupByLibrary.simpleMessage("Resend Code"),
    "responseError": MessageLookupByLibrary.simpleMessage(
      "An error happened while connecting to server, please try again later",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "specificPermissionRequired": m2,
    "theMaxLengthShouldBeLessThan": MessageLookupByLibrary.simpleMessage(
      "The max length should be less than",
    ),
    "theMinLengthShouldBeMoreThan": MessageLookupByLibrary.simpleMessage(
      "The min length should be more than",
    ),
    "thisFieldIsRequired": MessageLookupByLibrary.simpleMessage(
      "This field is required",
    ),
    "tryEnablingItFromYourPhoneSettings": MessageLookupByLibrary.simpleMessage(
      "Try enabling it from your phone settings",
    ),
    "unauthorized": MessageLookupByLibrary.simpleMessage("Unauthorized"),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "Unknown error occurred, please try again",
    ),
    "update": MessageLookupByLibrary.simpleMessage("Update"),
  };
}
