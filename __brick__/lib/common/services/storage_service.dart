import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:{{ projectName }}/common_libs.dart';
import 'package:{{ projectName }}/common/constants/setting_constants.dart';

class StorageService {
  final SharedPreferences _prefs;

  StorageService(this._prefs);

  Locale? getLocale() {
    final p = _prefs.getString(SettingConstants.locale);
    if (p != null) {
      final Map<String, String?> locale = jsonDecode(p);
      return Locale(locale['languageCode'] as String, locale['countryCode'] as String);
    }
    return null;
  }

  Future<void> setLocale(Locale value) async {
    await _prefs.setString(
      SettingConstants.locale,
      jsonEncode({'languageCode': value.languageCode, 'countryCode': value.countryCode}),
    );
  }
}
