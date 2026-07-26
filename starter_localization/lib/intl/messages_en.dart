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
        "accountNotVerifiedErrorMessage":
            MessageLookupByLibrary.simpleMessage("Account Not Verified"),
        "apply": MessageLookupByLibrary.simpleMessage("Apply"),
        "badCertificateMsg":
            MessageLookupByLibrary.simpleMessage("Bad certificate error 😢"),
        "badRequest": MessageLookupByLibrary.simpleMessage("Bad Request"),
        "cameraPermission": MessageLookupByLibrary.simpleMessage("Camera"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cancelErrorMessage": MessageLookupByLibrary.simpleMessage(
            "Operation has been cancelled"),
        "changeLangMessage": MessageLookupByLibrary.simpleMessage(
            "Select a language, the application will restart"),
        "changeLanguage":
            MessageLookupByLibrary.simpleMessage("Change Language"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "closeApp": MessageLookupByLibrary.simpleMessage("Close App"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "conflictError": MessageLookupByLibrary.simpleMessage("Conflict Error"),
        "connectionErrorMessage": MessageLookupByLibrary.simpleMessage(
            "Please check your internet connection"),
        "connectionTimeOut":
            MessageLookupByLibrary.simpleMessage("Connection time out"),
        "dialogUpdateMessage": MessageLookupByLibrary.simpleMessage(
            "For the best experience, update to the latest version to get new features and improvements."),
        "dialogUpdateTitle":
            MessageLookupByLibrary.simpleMessage("Update Required"),
        "didnotReceiveAnyCode": MessageLookupByLibrary.simpleMessage(
            "Didn\'t you receive any code?"),
        "empty": MessageLookupByLibrary.simpleMessage("Empty"),
        "emptyScreen":
            MessageLookupByLibrary.simpleMessage("This page is empty"),
        "enterCodeText": MessageLookupByLibrary.simpleMessage(
            "please type the verification code send to"),
        "errorCancelToken": MessageLookupByLibrary.simpleMessage(
            "The connection has been interrupted"),
        "errorEmptyField": MessageLookupByLibrary.simpleMessage(
            "This field mustn\'t be empty"),
        "errorFetchDistance":
            MessageLookupByLibrary.simpleMessage("Could not fetch distance"),
        "errorOccurred":
            MessageLookupByLibrary.simpleMessage("Error Occured 😢"),
        "errorTxt":
            MessageLookupByLibrary.simpleMessage("This field can\'t be empty"),
        "failedRefresher":
            MessageLookupByLibrary.simpleMessage("Failed to get data"),
        "firstName": MessageLookupByLibrary.simpleMessage("First Name"),
        "forbidden": MessageLookupByLibrary.simpleMessage("Forbidden"),
        "generalErrorMessage": MessageLookupByLibrary.simpleMessage(
            "An error has occurred. Please try again later"),
        "getPeople": MessageLookupByLibrary.simpleMessage("Get People"),
        "getPokemons": MessageLookupByLibrary.simpleMessage("Get Pokemons"),
        "guetsMessage": MessageLookupByLibrary.simpleMessage(
            "Sorry, you are a guest, login to continue."),
        "homePage": MessageLookupByLibrary.simpleMessage("Home Page"),
        "ignoreForNow": MessageLookupByLibrary.simpleMessage("Ignore"),
        "internalServerErrorMessage": MessageLookupByLibrary.simpleMessage(
            "The server encountered an internal error or misconfigurtion and was unable to complete your request."),
        "invalidConfirmPassword": MessageLookupByLibrary.simpleMessage(
            "Password and confirm password doesn\'t match"),
        "invalidEmail":
            MessageLookupByLibrary.simpleMessage("Invalid email address"),
        "invalidPassword":
            MessageLookupByLibrary.simpleMessage("Invalid password"),
        "invalidPhone":
            MessageLookupByLibrary.simpleMessage("Invalid phone number"),
        "invalidPhoneNumber": MessageLookupByLibrary.simpleMessage(
            "Please enter a valid phone number ex: 09xx-xxx-xxx"),
        "justLog": MessageLookupByLibrary.simpleMessage("Just Log"),
        "lastName": MessageLookupByLibrary.simpleMessage("Last Name"),
        "locationPermission": MessageLookupByLibrary.simpleMessage("Location"),
        "logOut": MessageLookupByLibrary.simpleMessage("Logout"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "loginErrorRequired":
            MessageLookupByLibrary.simpleMessage("login Error Required"),
        "makeSureSpecificPermissionGranted": m0,
        "mapPathError":
            MessageLookupByLibrary.simpleMessage("Couldn\'t find path"),
        "noDataRefresher": MessageLookupByLibrary.simpleMessage("No data"),
        "noResultFound":
            MessageLookupByLibrary.simpleMessage("No Result Found"),
        "notFound": m1,
        "notValidResponse":
            MessageLookupByLibrary.simpleMessage("Not valid response"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "oopsErrorMessage": MessageLookupByLibrary.simpleMessage("OOPS !"),
        "openAppSettings":
            MessageLookupByLibrary.simpleMessage("Open App Settings"),
        "optionalUpdateMessage": MessageLookupByLibrary.simpleMessage(
            "There is a new version for this app. Update to get new features and improvements"),
        "optionalUpdateTitle":
            MessageLookupByLibrary.simpleMessage("New Update!"),
        "or": MessageLookupByLibrary.simpleMessage("Or"),
        "otpVerification":
            MessageLookupByLibrary.simpleMessage("OTP Verification"),
        "pageEmpty":
            MessageLookupByLibrary.simpleMessage("The page has no content .."),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "permissionRequiredMessage": MessageLookupByLibrary.simpleMessage(
            "make sure to grant the previous permission to be able to use the app."),
        "permissionRequiredTitle": MessageLookupByLibrary.simpleMessage(
            "The previous permission is required!"),
        "phone": MessageLookupByLibrary.simpleMessage("Phone Number"),
        "pressTwiceToExit":
            MessageLookupByLibrary.simpleMessage("Press twice to exit"),
        "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
        "reportError": MessageLookupByLibrary.simpleMessage(
            "An error has been occurred, please click send to help us fixing the problem"),
        "resendCode": MessageLookupByLibrary.simpleMessage("Resend Code"),
        "responseError": MessageLookupByLibrary.simpleMessage(
            "An error happened while connecting to server, please try again later"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "send": MessageLookupByLibrary.simpleMessage("Send"),
        "signUp": MessageLookupByLibrary.simpleMessage("Signup"),
        "specificPermissionRequired": m2,
        "switchTheme": MessageLookupByLibrary.simpleMessage("Switch theme"),
        "testErrorScreen":
            MessageLookupByLibrary.simpleMessage("Test Error Handler"),
        "testFailureRequest":
            MessageLookupByLibrary.simpleMessage("Test Failure Request"),
        "testSuccessRequest":
            MessageLookupByLibrary.simpleMessage("Test Success Request"),
        "testValidatorRequest":
            MessageLookupByLibrary.simpleMessage("Test Validator Request"),
        "theMaxLengthShouldBeLessThan": MessageLookupByLibrary.simpleMessage(
            "The max length should be less than"),
        "theMinLengthShouldBeMoreThan": MessageLookupByLibrary.simpleMessage(
            "The min length should be more than"),
        "thisFieldIsRequired":
            MessageLookupByLibrary.simpleMessage("This field is required"),
        "translationTest":
            MessageLookupByLibrary.simpleMessage("Translation Test"),
        "tryEnablingItFromYourPhoneSettings":
            MessageLookupByLibrary.simpleMessage(
                "Try enabling it from your phone settings"),
        "unauthorized": MessageLookupByLibrary.simpleMessage("Unauthorized"),
        "unknownError": MessageLookupByLibrary.simpleMessage(
            "Unknown error occurred, please try again"),
        "update": MessageLookupByLibrary.simpleMessage("Update"),
        "updateMessage": MessageLookupByLibrary.simpleMessage(
            "For the best experience, update to the latest version to get new features and improvements."),
        "updateTitle": MessageLookupByLibrary.simpleMessage("Update Required"),
        "userName": MessageLookupByLibrary.simpleMessage("User name"),
        "welcome": MessageLookupByLibrary.simpleMessage("Welcome")
      };
}
