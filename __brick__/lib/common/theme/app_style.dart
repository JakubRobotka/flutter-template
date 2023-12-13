import 'package:{{ projectName }}/common/services/platform_service.dart';
import 'package:{{ projectName }}/common/theme/app_colors.dart';
import 'package:{{ projectName }}/common_libs.dart';

class AppStyle {
  AppStyle({Size? defaultScreenSize}) {
    if (defaultScreenSize == null) {
      scale = 1;
      screenSize = const Size(0, 0);
      return;
    }

    final shortestSide = defaultScreenSize.shortestSide;
    const phoneXl = 600;
    const phoneLg = 414;
    if (shortestSide > phoneXl) {
      scale = 1;
    } else if (shortestSide > phoneLg) {
      scale = .9; // phone
    } else {
      scale = 1; // small phone
    }
    screenSize = defaultScreenSize;
  }

  late double scale;
  late final Size screenSize;

  final AppColors colors = AppColors();
  final Corners corners = Corners();
  final AppDurations durations = AppDurations();
  late final Sizing size = Sizing(scale);
  late final AppSpacing spacing = AppSpacing(size);
}

@immutable
class AppDurations {
  final Duration slow = const Duration(milliseconds: 1000);
  final Duration base = const Duration(milliseconds: 300);
  final Duration fast = const Duration(milliseconds: 200);
  final Duration pageTransition = const Duration(milliseconds: 200);
  final Duration sheetTransition =
      PlatformService.isAndroid ? const Duration(milliseconds: 400) : const Duration(milliseconds: 250);
}

@immutable
class Corners {
  final double sm = 4;
  final double md = 8;
  final double lg = 12;
  final double xl = 16;
  final double xxl = 24;
}

@immutable
class Sizing {
  final double _scale;

  Sizing(this._scale);

  late final double _spaceUnit = 16 * _scale;
  late final double s1 = 0.0625 * _spaceUnit;
  late final double s2 = 0.125 * _spaceUnit;
  late final double s4 = 0.25 * _spaceUnit;
  late final double s6 = 0.375 * _spaceUnit;
  late final double s8 = 0.5 * _spaceUnit;
  late final double s10 = 0.625 * _spaceUnit;
  late final double s12 = 0.75 * _spaceUnit;
  late final double s14 = 0.875 * _spaceUnit;
  late final double s16 = _spaceUnit;
  late final double s18 = 1.125 * _spaceUnit;
  late final double s20 = 1.25 * _spaceUnit;
  late final double s24 = 1.5 * _spaceUnit;
  late final double s26 = 1.625 * _spaceUnit;
  late final double s28 = 1.75 * _spaceUnit;
  late final double s30 = 1.875 * _spaceUnit;
  late final double s32 = 2 * _spaceUnit;
  late final double s36 = 2.25 * _spaceUnit;
  late final double s38 = 2.375 * _spaceUnit;
  late final double s40 = 2.5 * _spaceUnit;
  late final double s44 = 2.75 * _spaceUnit;
  late final double s48 = 3 * _spaceUnit;
  late final double s50 = 3.125 * _spaceUnit;
  late final double s56 = 3.5 * _spaceUnit;
  late final double s60 = 3.75 * _spaceUnit;
  late final double s68 = 4.25 * _spaceUnit;
  late final double s70 = 4.375 * _spaceUnit;
  late final double s80 = 5 * _spaceUnit;
  late final double s82 = 5.125 * _spaceUnit;

  dobule(double value) => _spaceUnit * (value / 16);
}

@immutable
class AppSpacing {
  final Sizing size;

  AppSpacing(this.size);

  late final EdgeInsets py1 = EdgeInsets.symmetric(vertical: size.s1);
  late final EdgeInsets py2 = EdgeInsets.symmetric(vertical: size.s2);
  late final EdgeInsets py4 = EdgeInsets.symmetric(vertical: size.s4);
  late final EdgeInsets py6 = EdgeInsets.symmetric(vertical: size.s6);
  late final EdgeInsets py8 = EdgeInsets.symmetric(vertical: size.s8);
  late final EdgeInsets py10 = EdgeInsets.symmetric(vertical: size.s10);
  late final EdgeInsets py12 = EdgeInsets.symmetric(vertical: size.s12);
  late final EdgeInsets py16 = EdgeInsets.symmetric(vertical: size.s16);
  late final EdgeInsets py20 = EdgeInsets.symmetric(vertical: size.s20);
  late final EdgeInsets py24 = EdgeInsets.symmetric(vertical: size.s24);
  late final EdgeInsets py28 = EdgeInsets.symmetric(vertical: size.s28);
  late final EdgeInsets py32 = EdgeInsets.symmetric(vertical: size.s32);
  late final EdgeInsets py36 = EdgeInsets.symmetric(vertical: size.s36);
  late final EdgeInsets py40 = EdgeInsets.symmetric(vertical: size.s40);
  late final EdgeInsets py50 = EdgeInsets.symmetric(vertical: size.s50);

  late final EdgeInsets pb1 = EdgeInsets.only(bottom: size.s1);
  late final EdgeInsets pb2 = EdgeInsets.only(bottom: size.s2);
  late final EdgeInsets pb4 = EdgeInsets.only(bottom: size.s4);
  late final EdgeInsets pb6 = EdgeInsets.only(bottom: size.s6);
  late final EdgeInsets pb8 = EdgeInsets.only(bottom: size.s8);
  late final EdgeInsets pb10 = EdgeInsets.only(bottom: size.s10);
  late final EdgeInsets pb12 = EdgeInsets.only(bottom: size.s12);
  late final EdgeInsets pb16 = EdgeInsets.only(bottom: size.s16);
  late final EdgeInsets pb20 = EdgeInsets.only(bottom: size.s20);
  late final EdgeInsets pb24 = EdgeInsets.only(bottom: size.s24);
  late final EdgeInsets pb28 = EdgeInsets.only(bottom: size.s28);
  late final EdgeInsets pb32 = EdgeInsets.only(bottom: size.s32);
  late final EdgeInsets pb36 = EdgeInsets.only(bottom: size.s36);
  late final EdgeInsets pb40 = EdgeInsets.only(bottom: size.s40);
  late final EdgeInsets pb50 = EdgeInsets.only(bottom: size.s50);

  late final EdgeInsets pr1 = EdgeInsets.only(right: size.s1);
  late final EdgeInsets pr2 = EdgeInsets.only(right: size.s2);
  late final EdgeInsets pr4 = EdgeInsets.only(right: size.s4);
  late final EdgeInsets pr6 = EdgeInsets.only(right: size.s6);
  late final EdgeInsets pr8 = EdgeInsets.only(right: size.s8);
  late final EdgeInsets pr10 = EdgeInsets.only(right: size.s10);
  late final EdgeInsets pr12 = EdgeInsets.only(right: size.s12);
  late final EdgeInsets pr16 = EdgeInsets.only(right: size.s16);
  late final EdgeInsets pr20 = EdgeInsets.only(right: size.s20);
  late final EdgeInsets pr24 = EdgeInsets.only(right: size.s24);
  late final EdgeInsets pr28 = EdgeInsets.only(right: size.s28);
  late final EdgeInsets pr32 = EdgeInsets.only(right: size.s32);
  late final EdgeInsets pr36 = EdgeInsets.only(right: size.s36);
  late final EdgeInsets pr40 = EdgeInsets.only(right: size.s40);
  late final EdgeInsets pr50 = EdgeInsets.only(right: size.s50);

  late final EdgeInsets pl1 = EdgeInsets.only(left: size.s1);
  late final EdgeInsets pl2 = EdgeInsets.only(left: size.s2);
  late final EdgeInsets pl4 = EdgeInsets.only(left: size.s4);
  late final EdgeInsets pl6 = EdgeInsets.only(left: size.s6);
  late final EdgeInsets pl8 = EdgeInsets.only(left: size.s8);
  late final EdgeInsets pl10 = EdgeInsets.only(left: size.s10);
  late final EdgeInsets pl12 = EdgeInsets.only(left: size.s12);
  late final EdgeInsets pl16 = EdgeInsets.only(left: size.s16);
  late final EdgeInsets pl20 = EdgeInsets.only(left: size.s20);
  late final EdgeInsets pl24 = EdgeInsets.only(left: size.s24);
  late final EdgeInsets pl28 = EdgeInsets.only(left: size.s28);
  late final EdgeInsets pl32 = EdgeInsets.only(left: size.s32);
  late final EdgeInsets pl36 = EdgeInsets.only(left: size.s36);
  late final EdgeInsets pl40 = EdgeInsets.only(left: size.s40);
  late final EdgeInsets pl50 = EdgeInsets.only(left: size.s50);

  late final EdgeInsets pt1 = EdgeInsets.only(top: size.s1);
  late final EdgeInsets pt2 = EdgeInsets.only(top: size.s2);
  late final EdgeInsets pt4 = EdgeInsets.only(top: size.s4);
  late final EdgeInsets pt6 = EdgeInsets.only(top: size.s6);
  late final EdgeInsets pt8 = EdgeInsets.only(top: size.s8);
  late final EdgeInsets pt10 = EdgeInsets.only(top: size.s10);
  late final EdgeInsets pt12 = EdgeInsets.only(top: size.s12);
  late final EdgeInsets pt16 = EdgeInsets.only(top: size.s16);
  late final EdgeInsets pt20 = EdgeInsets.only(top: size.s20);
  late final EdgeInsets pt24 = EdgeInsets.only(top: size.s24);
  late final EdgeInsets pt28 = EdgeInsets.only(top: size.s28);
  late final EdgeInsets pt32 = EdgeInsets.only(top: size.s32);
  late final EdgeInsets pt36 = EdgeInsets.only(top: size.s36);
  late final EdgeInsets pt40 = EdgeInsets.only(top: size.s40);
  late final EdgeInsets pt50 = EdgeInsets.only(top: size.s50);

  late final EdgeInsets px1 = EdgeInsets.symmetric(horizontal: size.s1);
  late final EdgeInsets px2 = EdgeInsets.symmetric(horizontal: size.s2);
  late final EdgeInsets px4 = EdgeInsets.symmetric(horizontal: size.s4);
  late final EdgeInsets px6 = EdgeInsets.symmetric(horizontal: size.s6);
  late final EdgeInsets px8 = EdgeInsets.symmetric(horizontal: size.s8);
  late final EdgeInsets px10 = EdgeInsets.symmetric(horizontal: size.s10);
  late final EdgeInsets px12 = EdgeInsets.symmetric(horizontal: size.s12);
  late final EdgeInsets px16 = EdgeInsets.symmetric(horizontal: size.s16);
  late final EdgeInsets px20 = EdgeInsets.symmetric(horizontal: size.s20);
  late final EdgeInsets px24 = EdgeInsets.symmetric(horizontal: size.s24);
  late final EdgeInsets px28 = EdgeInsets.symmetric(horizontal: size.s28);
  late final EdgeInsets px32 = EdgeInsets.symmetric(horizontal: size.s32);
  late final EdgeInsets px36 = EdgeInsets.symmetric(horizontal: size.s36);
  late final EdgeInsets px40 = EdgeInsets.symmetric(horizontal: size.s40);
  late final EdgeInsets px50 = EdgeInsets.symmetric(horizontal: size.s50);

  late final EdgeInsets p1 = EdgeInsets.all(size.s1);
  late final EdgeInsets p2 = EdgeInsets.all(size.s2);
  late final EdgeInsets p4 = EdgeInsets.all(size.s4);
  late final EdgeInsets p6 = EdgeInsets.all(size.s6);
  late final EdgeInsets p8 = EdgeInsets.all(size.s8);
  late final EdgeInsets p10 = EdgeInsets.all(size.s10);
  late final EdgeInsets p12 = EdgeInsets.all(size.s12);
  late final EdgeInsets p16 = EdgeInsets.all(size.s16);
  late final EdgeInsets p20 = EdgeInsets.all(size.s20);
  late final EdgeInsets p24 = EdgeInsets.all(size.s24);
  late final EdgeInsets p28 = EdgeInsets.all(size.s28);
  late final EdgeInsets p32 = EdgeInsets.all(size.s32);
  late final EdgeInsets p36 = EdgeInsets.all(size.s36);
  late final EdgeInsets p40 = EdgeInsets.all(size.s40);
  late final EdgeInsets p50 = EdgeInsets.all(size.s50);
}
