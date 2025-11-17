import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:beit_alnakha_admin/core/functions/show_toastification_widget.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';

class LauncherHelper {
  /// ✅ فتح أي رابط URL في المتصفح الخارجي
  static Future<void> openUrlExternalApp({
    required BuildContext context,
    required String url,
  }) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else if (context.mounted) {
      showToastificationWidget(
          context: context, message: AppStrings.failedToOpenUrl);
    }
  }

  /// ✅ فتح رابط داخل التطبيق باستخدام WebView
  static Future<void> openUrlInApp({
    required BuildContext context,
    required String url,
  }) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppWebView);
    } else if (context.mounted) {
      showToastificationWidget(
          context: context, message: AppStrings.failedToOpenUrl);
    }
  }

  /// ✅ فتح محادثة واتساب
  static Future<void> openWhatsApp({
    required BuildContext context,
    required String phoneNumber,
  }) async {
    final Uri url = Uri.parse("https://wa.me/$phoneNumber");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else if (context.mounted) {
      showToastificationWidget(
          context: context, message: AppStrings.failedToOpenWhatsApp);
    }
  }

  /// ✅ إجراء مكالمة هاتفية
  static Future<void> makePhoneCall({
    required BuildContext context,
    required String phoneNumber,
  }) async {
    final Uri url = Uri.parse("tel:$phoneNumber");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else if (context.mounted) {
      showToastificationWidget(
          context: context, message: AppStrings.callFailed);
    }
  }

  /// ✅ إرسال رسالة SMS
  static Future<void> sendSMS({
    required BuildContext context,
    required String phoneNumber,
  }) async {
    final Uri url = Uri.parse("sms:$phoneNumber");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else if (context.mounted) {
      showToastificationWidget(context: context, message: AppStrings.smsFailed);
    }
  }

  /// ✅ إرسال إيميل
  static Future<void> sendEmail({
    required BuildContext context,
    required String email,
    String? subject,
    String? body,
  }) async {
    final Uri url = Uri.parse(
        "mailto:$email?subject=${Uri.encodeComponent(subject ?? '')}&body=${Uri.encodeComponent(body ?? '')}");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else if (context.mounted) {
      showToastificationWidget(
          context: context, message: AppStrings.emailFailed);
    }
  }

  /// ✅ فتح موقع في **Google Maps** باستخدام **اسم المكان**
  static Future<void> openGoogleMapsByName({
    required BuildContext context,
    required String query,
  }) async {
    final Uri url = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(query)}");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else if (context.mounted) {
      showToastificationWidget(
        context: context,
        message: AppStrings.mapsFailedByName,
      );
    }
  }

  /// ✅ فتح موقع في **Google Maps** باستخدام **الإحداثيات**
  static Future<void> openGoogleMapsByCoordinates({
    required BuildContext context,
    required double latitude,
    required double longitude,
  }) async {
    final Uri url = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else if (context.mounted) {
      showToastificationWidget(
        context: context,
        message: AppStrings.mapsFailedByName,
      );
    }
  }
}

/* permissions
 // android/app/src/main/AndroidManifest.xml
      <uses-permission android:name="android.permission.INTERNET" />
      <uses-permission android:name="android.permission.QUERY_ALL_PACKAGES"/>
      <uses-permission android:name="android.permission.CALL_PHONE"/>

      // queries

      <queries>
    <!-- دعم فتح الروابط -->
    <intent>
        <action android:name="android.intent.action.VIEW"/>
        <data android:scheme="http"/>
    </intent>
    <intent>
        <action android:name="android.intent.action.VIEW"/>
        <data android:scheme="https"/>
    </intent>

    <!-- دعم فتح واتساب -->
    <intent>
        <action android:name="android.intent.action.VIEW"/>
        <data android:scheme="whatsapp"/>
    </intent>

    <!-- دعم المكالمات الهاتفية -->
    <intent>
        <action android:name="android.intent.action.DIAL"/>
        <data android:scheme="tel"/>
    </intent>
  </queries>
//===========================================================================//
 // ios/Runner/Info.plist


<dict>
    <key>LSApplicationQueriesSchemes</key>
<array>
    <string>http</string>
    <string>https</string>
    <string>mailto</string>
    <string>tel</string>
    <string>sms</string>
</array>
<key>NSAllowsArbitraryLoads</key>
<true/>
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>comgooglemaps</string>
</array>

</dict>



 */
