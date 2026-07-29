// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(permissionName) =>
      "لاستخدام التطبيق يجب التأكد من إعطاء صلاحية الوصول للموقع.";

  static String m1(url) => "لم يتم إيجاد الصفحة المطلوبة ${url}";

  static String m2(permissionName) =>
      "صلاحية الوصول لل${permissionName} مطلوبة!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accessDenied": MessageLookupByLibrary.simpleMessage("تم رفض الوصول!"),
    "accountNotVerifiedErrorMessage": MessageLookupByLibrary.simpleMessage(
      "لم يتم التحقق من الحساب",
    ),
    "badRequest": MessageLookupByLibrary.simpleMessage("إرسال خاطئ"),
    "cameraPermission": MessageLookupByLibrary.simpleMessage("كاميرا"),
    "cancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "cancelErrorMessage": MessageLookupByLibrary.simpleMessage(
      "تم إلغاء العملية",
    ),
    "changeLangMessage": MessageLookupByLibrary.simpleMessage(
      "اختر اللغة، ستتم إعادة تشغيل التطبيق",
    ),
    "closeApp": MessageLookupByLibrary.simpleMessage("إغلاق التطبيق"),
    "confirm": MessageLookupByLibrary.simpleMessage("تأكيد"),
    "conflictError": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ في المعلومات",
    ),
    "connectionErrorMessage": MessageLookupByLibrary.simpleMessage(
      "يرجى التحقق من الاتصال بالإنترنت",
    ),
    "connectionTimeOut": MessageLookupByLibrary.simpleMessage(
      "انتهت مدة الجلسة",
    ),
    "dialogUpdateMessage": MessageLookupByLibrary.simpleMessage(
      "للحصول على أفضل تجربة ممكنة، يرجى تحديث التطبيق للتمتع بآخر الميزات",
    ),
    "dialogUpdateTitle": MessageLookupByLibrary.simpleMessage("التحديث مطلوب"),
    "didnotReceiveAnyCode": MessageLookupByLibrary.simpleMessage(
      "لم يتم إرسال الكود؟",
    ),
    "emptyScreen": MessageLookupByLibrary.simpleMessage("هذه الصفحة فارغة"),
    "errorEmptyField": MessageLookupByLibrary.simpleMessage(
      "لا يمكن لهذا الحقل أن يكون فارغاً",
    ),
    "errorFetchDistance": MessageLookupByLibrary.simpleMessage(
      "فشل في تقدير الوقت والمسافة",
    ),
    "errorOccurred": MessageLookupByLibrary.simpleMessage("حدث خطأ ما 😢"),
    "failedRefresher": MessageLookupByLibrary.simpleMessage(
      "فشل في جلب البيانات",
    ),
    "forbidden": MessageLookupByLibrary.simpleMessage("لا يمكن الوصول الآن"),
    "generalErrorMessage": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ ما. يرجى المحاولة لاحقاً",
    ),
    "guetsMessage": MessageLookupByLibrary.simpleMessage(
      "عذراً ، أنت في وضع الزائر ، سجل الدخول للمتابعة.",
    ),
    "ignoreForNow": MessageLookupByLibrary.simpleMessage("تجاهل"),
    "internalServerErrorMessage": MessageLookupByLibrary.simpleMessage(
      "واجه الخادم خطأ أو تهيئة خاطئة ولم يتمكن من إكمال طلبك سيتم إصلاح المشكلة في أقرب وقت.",
    ),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "عنوان البريد الإلكتروني غير صالح",
    ),
    "invalidPassword": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور غير صالحة",
    ),
    "invalidPhone": MessageLookupByLibrary.simpleMessage("رقم الهاتف غير صالح"),
    "locationPermission": MessageLookupByLibrary.simpleMessage("موقع"),
    "loginErrorRequired": MessageLookupByLibrary.simpleMessage(
      "تسجيل الدخول مطلوب",
    ),
    "makeSureSpecificPermissionGranted": m0,
    "mapPathError": MessageLookupByLibrary.simpleMessage(
      "لا نستطع تحديد الطريق",
    ),
    "noDataRefresher": MessageLookupByLibrary.simpleMessage(
      "لم يعد يوجد بيانات",
    ),
    "noResultFound": MessageLookupByLibrary.simpleMessage("لا يوجد نتائج"),
    "notFound": m1,
    "ok": MessageLookupByLibrary.simpleMessage("موافق"),
    "oopsErrorMessage": MessageLookupByLibrary.simpleMessage("أوبس !"),
    "openAppSettings": MessageLookupByLibrary.simpleMessage(
      "فتح إعدادات التطبيق",
    ),
    "optionalUpdateMessage": MessageLookupByLibrary.simpleMessage(
      "يوجد نسخة جديدة من هذا التطبيق. يرجى التحديث للتمتع بآخر الميزات",
    ),
    "optionalUpdateTitle": MessageLookupByLibrary.simpleMessage("تحديث جديد!"),
    "otpVerification": MessageLookupByLibrary.simpleMessage("رمز التحقق"),
    "permissionRequiredMessage": MessageLookupByLibrary.simpleMessage(
      "يجب إعطاء صلاحية الوصول السابفة لتتمكن من استخدام التطبيق",
    ),
    "permissionRequiredTitle": MessageLookupByLibrary.simpleMessage(
      "صلاحية الوصول مطلوبة",
    ),
    "pressTwiceToExit": MessageLookupByLibrary.simpleMessage(
      "إضفط مرتين للخروج",
    ),
    "refresh": MessageLookupByLibrary.simpleMessage("تحديث"),
    "resendCode": MessageLookupByLibrary.simpleMessage("إعادة إرسال الرمز"),
    "responseError": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ أثناء الاتصال بالخادم ، يرجى المحاولة لاحقًا",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("إعادة المحاولة"),
    "search": MessageLookupByLibrary.simpleMessage("بحث"),
    "specificPermissionRequired": m2,
    "theMaxLengthShouldBeLessThan": MessageLookupByLibrary.simpleMessage(
      "الحد الأعلى هو",
    ),
    "theMinLengthShouldBeMoreThan": MessageLookupByLibrary.simpleMessage(
      "الحد الأدنى هو",
    ),
    "thisFieldIsRequired": MessageLookupByLibrary.simpleMessage(
      "هذا الحقل مطلوب",
    ),
    "tryEnablingItFromYourPhoneSettings": MessageLookupByLibrary.simpleMessage(
      "حاول تشغيلها من إعدادات جهازك",
    ),
    "unauthorized": MessageLookupByLibrary.simpleMessage("غير مخول لك بالوصول"),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ غير معروف، الرجاء إعادة المحاولة",
    ),
    "update": MessageLookupByLibrary.simpleMessage("تحديث"),
  };
}
