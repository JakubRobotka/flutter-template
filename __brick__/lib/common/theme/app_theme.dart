import 'package:{{ projectName }}/common_libs.dart';

class AppTheme {
  static ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      bottomSheetTheme: _bottomSheetThemeData,
    );
  }

  static const BottomSheetThemeData _bottomSheetThemeData = BottomSheetThemeData();
}
