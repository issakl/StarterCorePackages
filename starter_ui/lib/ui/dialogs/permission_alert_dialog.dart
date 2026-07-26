import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:starter_ui/ui/widgets/restart_widget.dart';
import 'package:starter_ui/navigation/nav.dart';
import 'package:starter_localization/l10n.dart';
import 'package:starter_ui/theme/ui_dimens.dart';

class PermissionAlertDialog extends StatelessWidget {
  final String? permissionName;

  const PermissionAlertDialog({required this.permissionName, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dimens = context.uiDimens;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AlertDialog(
        titlePadding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(24),
          ),
        ),
        title: Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Color(0xffF2F1F2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: RichText(
            text: TextSpan(
              text: S.current.accessDenied,
              style: TextStyle(
                fontSize: dimens.permissionTitleFontSize.sp,
                color: const Color(0xff222222),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        content: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: permissionName == null
                            ? S.current.permissionRequiredTitle
                            : S.current
                                .specificPermissionRequired(permissionName!),
                      ),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: permissionName == null
                            ? S.current.permissionRequiredMessage
                            : S.current.makeSureSpecificPermissionGranted(
                                permissionName!),
                      ),
                      const TextSpan(text: '\n'),
                      TextSpan(
                          text: S.current.tryEnablingItFromYourPhoneSettings),
                    ],
                    style: TextStyle(
                      fontSize: dimens.permissionBodyFontSize.sp,
                      color: const Color(0xff8594AB),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              64.verticalSpace,
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: SizedBox(
                  width: 1.sw,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              ScreenUtil().setWidth(dimens.permissionButtonRadius),
                            ),
                          ),
                          backgroundColor: Theme.of(context).colorScheme.primary,
                        ),
                        child: Text(
                          S.current.closeApp,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: dimens.permissionBodyFontSize.sp,
                          ),
                        ),
                        onPressed: () {
                          Nav.pop();
                          SystemNavigator.pop();
                        },
                      ),
                      MaterialButton(
                        color: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(dimens.permissionButtonRadius.r),
                        ),
                        child: Text(
                          S.current.openAppSettings,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: dimens.permissionBodyFontSize.sp,
                          ),
                        ),
                        onPressed: () async {
                          Nav.pop();
                          await openAppSettings();
                          RestartWidget.restartApp(context);
                        },
                        textColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
