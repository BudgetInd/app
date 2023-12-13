import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future<String> initPlatformInfo() async {
  String deviceData = '';
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  try {
    if (kIsWeb) {
      deviceData = readBrowserInfo(await deviceInfo.webBrowserInfo);
    } else {
      deviceData = switch (defaultTargetPlatform) {
        // TargetPlatform.android => _readAndroidInfo(await deviceInfo.androidInfo),
        // TargetPlatform.iOS => _readIOSInfo(await deviceInfo.iosInfo),
        // TargetPlatform.linux => _readLinuxInfo(await deviceInfo.linuxInfo),
        // TargetPlatform.windows => _readWindowsInfo(await deviceInfo.windowsInfo),
        TargetPlatform.iOS => '',
        TargetPlatform.macOS => readMacInfo(await deviceInfo.macOsInfo),
        TargetPlatform.linux => '',
        TargetPlatform.android => '',
        TargetPlatform.windows => '',
        TargetPlatform.fuchsia => 'Fuchsia platform',
      };
    }
  } on PlatformException {
    deviceData = 'Failed to get platform version.';
  }

  return deviceData;
}

String readBrowserInfo(WebBrowserInfo data) {
  return "${data.browserName.toString().split('.')[1]} ${data.vendor} ${data.platform}";
}

String readMacInfo(MacOsDeviceInfo data) {
  return '${data.computerName} ${data.model} ${data.majorVersion}.${data.minorVersion}.${data.patchVersion}';
}
