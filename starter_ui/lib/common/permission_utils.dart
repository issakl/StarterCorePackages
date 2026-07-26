import 'package:permission_handler/permission_handler.dart';

import 'package:starter_localization/l10n.dart';
import 'package:starter_ui/ui_runtime.dart';
import '../ui/dialogs/permission_alert_dialog.dart';
import '../ui/dialogs/show_dialog.dart';

enum PermissionOption {
  NoPermission,
  ForcePermission,
  DefaultPermission,
}

Future<Map<Permission, PermissionStatus>> requestPermission(
    RequestPermissionsParam param) async {
  Map<Permission, PermissionStatus> result = {};
  final permissionsList = Permission.values;
  for (int i = 0; i < permissionsList.length; i++) {
    final permission = permissionsList[i];
    PermissionOption permissionOption =
        param.toMap[permission] ?? PermissionOption.NoPermission;

    if (permissionOption != PermissionOption.NoPermission) {
      final isForce = permissionOption == PermissionOption.ForcePermission;
      result[permission] = await _requestPermission(permission, isForce);
      print(result[Permission.location]);
    }
  }
  return result;
}

Future<PermissionStatus> _requestPermission(
    Permission permission, bool isForce) async {
  if (await permission.isGranted) return PermissionStatus.granted;

  if (await permission.isPermanentlyDenied) {
    if (isForce) await _showDialog(permission);
    return PermissionStatus.permanentlyDenied;
  }

  PermissionStatus status = await permission.request();

  if (!isForce || status.isGranted) return status;

  while (!status.isGranted) {
    status = await permission.request();

    if (status.isPermanentlyDenied) {
      await _showDialog(permission);
      break;
    }
  }
  return status;
}

Future<void> _showDialog(Permission permission) async {
  await ShowDialog().showElasticDialog(
    context: UiRuntime.appContext!,
    barrierDismissible: false,
    builder: (context) => PermissionAlertDialog(
      permissionName: _getTranslatedPermissionName(permission),
    ),
  );
}

class RequestPermissionsParam {
  final PermissionOption calendar;
  final PermissionOption camera;
  final PermissionOption contacts;
  final PermissionOption location;
  final PermissionOption locationAlways;
  final PermissionOption locationWhenInUse;
  final PermissionOption mediaLibrary;
  final PermissionOption microphone;
  final PermissionOption phone;
  final PermissionOption photos;
  final PermissionOption photosAddOnly;
  final PermissionOption reminders;
  final PermissionOption sensors;
  final PermissionOption sms;
  final PermissionOption speech;
  final PermissionOption storage;
  final PermissionOption ignoreBatteryOptimizations;
  final PermissionOption notification;
  final PermissionOption accessMediaLocation;
  final PermissionOption activityRecognition;
  final PermissionOption bluetooth;
  final PermissionOption manageExternalStorage;
  final PermissionOption systemAlertWindow;
  final PermissionOption requestInstallPackages;
  final PermissionOption appTrackingTransparency;
  final PermissionOption criticalAlerts;
  final PermissionOption accessNotificationPolicy;
  final PermissionOption bluetoothScan;
  final PermissionOption bluetoothAdvertise;
  final PermissionOption bluetoothConnect;

  const RequestPermissionsParam({
    this.calendar = PermissionOption.NoPermission,
    this.camera = PermissionOption.NoPermission,
    this.contacts = PermissionOption.NoPermission,
    this.location = PermissionOption.NoPermission,
    this.locationAlways = PermissionOption.NoPermission,
    this.locationWhenInUse = PermissionOption.NoPermission,
    this.mediaLibrary = PermissionOption.NoPermission,
    this.microphone = PermissionOption.NoPermission,
    this.phone = PermissionOption.NoPermission,
    this.photos = PermissionOption.NoPermission,
    this.photosAddOnly = PermissionOption.NoPermission,
    this.reminders = PermissionOption.NoPermission,
    this.sensors = PermissionOption.NoPermission,
    this.sms = PermissionOption.NoPermission,
    this.speech = PermissionOption.NoPermission,
    this.storage = PermissionOption.NoPermission,
    this.ignoreBatteryOptimizations = PermissionOption.NoPermission,
    this.notification = PermissionOption.NoPermission,
    this.accessMediaLocation = PermissionOption.NoPermission,
    this.activityRecognition = PermissionOption.NoPermission,
    this.bluetooth = PermissionOption.NoPermission,
    this.manageExternalStorage = PermissionOption.NoPermission,
    this.systemAlertWindow = PermissionOption.NoPermission,
    this.requestInstallPackages = PermissionOption.NoPermission,
    this.appTrackingTransparency = PermissionOption.NoPermission,
    this.criticalAlerts = PermissionOption.NoPermission,
    this.accessNotificationPolicy = PermissionOption.NoPermission,
    this.bluetoothScan = PermissionOption.NoPermission,
    this.bluetoothAdvertise = PermissionOption.NoPermission,
    this.bluetoothConnect = PermissionOption.NoPermission,
  });

  Map<Permission, PermissionOption> get toMap => {
        Permission.calendarFullAccess: calendar,
        Permission.camera: camera,
        Permission.contacts: contacts,
        Permission.location: location,
        Permission.locationAlways: locationAlways,
        Permission.locationWhenInUse: locationWhenInUse,
        Permission.mediaLibrary: mediaLibrary,
        Permission.microphone: microphone,
        Permission.phone: phone,
        Permission.photos: photos,
        Permission.photosAddOnly: photosAddOnly,
        Permission.reminders: reminders,
        Permission.sensors: sensors,
        Permission.sms: sms,
        Permission.speech: speech,
        Permission.storage: storage,
        Permission.ignoreBatteryOptimizations: ignoreBatteryOptimizations,
        Permission.notification: notification,
        Permission.accessMediaLocation: accessMediaLocation,
        Permission.activityRecognition: activityRecognition,
        Permission.bluetooth: bluetooth,
        Permission.manageExternalStorage: manageExternalStorage,
        Permission.systemAlertWindow: systemAlertWindow,
        Permission.requestInstallPackages: requestInstallPackages,
        Permission.appTrackingTransparency: appTrackingTransparency,
        Permission.criticalAlerts: criticalAlerts,
        Permission.accessNotificationPolicy: accessNotificationPolicy,
        Permission.bluetoothScan: bluetoothScan,
        Permission.bluetoothAdvertise: bluetoothAdvertise,
        Permission.bluetoothConnect: bluetoothConnect,
      };
}

String? _getTranslatedPermissionName(Permission permission) {
  if (permission == Permission.location ||
      permission == Permission.locationAlways ||
      permission == Permission.locationWhenInUse)
    return CoreS.current.locationPermission;
  else if (permission == Permission.camera)
    return CoreS.current.cameraPermission;
  // TODO: translate other permissions
  // else if (permission == Permission.microphone)
  //   return CoreS.current.microphonePermission;
  // else if (permission == Permission.photos)
  //   return CoreS.current.photosPermission;
  // else if (permission == Permission.photosAddOnly)
  //   return CoreS.current.photosAddOnlyPermission;
  // else if (permission == Permission.contacts)
  //   return CoreS.current.contactsPermission;
  // else if (permission == Permission.reminders)
  //   return CoreS.current.remindersPermission;
  // else if (permission == Permission.sensors)
  //   return CoreS.current.sensorsPermission;
  // else if (permission == Permission.sms)
  //   return CoreS.current.smsPermission;
  // else if (permission == Permission.speech)
  //   return CoreS.current.speechPermission;
  // else if (permission == Permission.storage)
  //   return CoreS.current.storagePermission;
  // else if (permission == Permission.ignoreBatteryOptimizations)
  //   return CoreS.current.ignoreBatteryOptimizationsPermission;
  // else if (permission == Permission.notification)
  //   return CoreS.current.notificationPermission;
  // else if (permission == Permission.accessMediaLocation)
  //   return CoreS.current.accessMediaLocationPermission;
  // else if (permission == Permission.activityRecognition)
  //   return CoreS.current.activityRecognitionPermission;
  // else if (permission == Permission.bluetooth)
  //   return CoreS.current.bluetoothPermission;
  // else if (permission == Permission.manageExternalStorage)
  //   return CoreS.current.manageExternalStoragePermission;
  // else if (permission == Permission.systemAlertWindow)
  //   return CoreS.current.systemAlertWindowPermission;
  // else if (permission == Permission.requestInstallPackages)
  //   return CoreS.current.requestInstallPackagesPermission;
  // else if (permission == Permission.appTrackingTransparency)
  //   return CoreS.current.appTrackingTransparencyPermission;
  // else if (permission == Permission.criticalAlerts)
  //   return CoreS.current.criticalAlertsPermission;
  // else if (permission == Permission.accessNotificationPolicy)
  //   return CoreS.current.accessNotificationPolicyPermission;
  // else if (permission == Permission.bluetoothScan)
  //   return CoreS.current.bluetoothScanPermission;
  // else if (permission == Permission.bluetoothAdvertise)
  //   return CoreS.current.bluetoothAdvertisePermission;
  // else if (permission == Permission.bluetoothConnect)
  //   return CoreS.current.bluetoothConnectPermission;
  else
    return null;
}
