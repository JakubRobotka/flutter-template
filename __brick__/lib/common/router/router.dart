import 'package:animations/animations.dart';
import 'package:sheet/route.dart';
import 'package:sheet/sheet.dart';
import 'package:{{ projectName }}/app/app_scaffold.dart';
import 'package:{{ projectName }}/common_libs.dart';
import 'package:{{ projectName }}/features/force_update/presentation/force_update_screen.dart';
import 'package:{{ projectName }}/features/homepage/presentation/homepage_screen.dart';
import 'package:{{ projectName }}/features/maintenance/presentation/maintenance_screen.dart';

class ScreenPaths {
  static String splash = '/';
  static String homepage = '/home';
  static String forceUpdate = '/force-update';
  static String maintenance = '/maintenance';

  void goHomepage(BuildContext context) => context.go(ScreenPaths.homepage);
  void goForceUpdate(BuildContext context) => context.go(ScreenPaths.forceUpdate);
  void goMaintanance(BuildContext context) => context.go(ScreenPaths.maintenance);

  static GlobalKey<NavigatorState> rootNavigationKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> mainNavigationKey = GlobalKey<NavigatorState>();
}

final appRouter = GoRouter(
  navigatorKey: ScreenPaths.rootNavigationKey,
  routes: [
    ShellRoute(
      parentNavigatorKey: ScreenPaths.rootNavigationKey,
      navigatorKey: ScreenPaths.mainNavigationKey,
      pageBuilder: (context, state, child) {
        return MaterialExtendedPage(
          key: state.pageKey,
          child: AppScaffold(
            child: child,
          ),
        );
      },
      routes: [
        AppRoute<void>(
          ScreenPaths.forceUpdate,
          ForceUpdateScreen.routeBuilder,
          animation: AppRouteAnimation.none,
        ),
        AppRoute<void>(
          ScreenPaths.maintenance,
          MaintenanceScreen.routeBuilder,
          animation: AppRouteAnimation.none,
        ),
        AppRoute<void>(
          ScreenPaths.homepage,
          HomepageScreen.routeBuilder,
        ),
      ],
    ),
  ],
);

enum AppRouteAnimation {
  none,
  fade,
  fadeThrough,
}

class AppRoute<T> extends GoRoute {
  AppRoute(
    path,
    Widget Function(BuildContext context, GoRouterState state) builder, {
    List<GoRoute> super.routes = const [],
    AppRouteAnimation animation = AppRouteAnimation.none,
    super.parentNavigatorKey,
    super.name,
    super.onExit,
    super.redirect,
  }) : super(
          path: path,
          pageBuilder: (context, state) {
            Widget child = builder(context, state);

            if (animation == AppRouteAnimation.fade) {
              return CustomTransitionPage<T>(
                key: state.pageKey,
                child: child,
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            }
            if (animation == AppRouteAnimation.fadeThrough) {
              return CustomTransitionPage<T>(
                key: state.pageKey,
                child: child,
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeThroughTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  );
                },
              );
            }

            return CupertinoExtendedPage<T>(
              key: state.pageKey,
              child: child,
            );
          },
        );
}

class AppSheetRoute<T> extends GoRoute {
  AppSheetRoute(
    String path, {
    required Widget Function(BuildContext builder, GoRouterState state) builder,
    List<GoRoute> routes = const [],
    super.parentNavigatorKey,
  }) : super(
          path: path,
          pageBuilder: (context, state) {
            if (PlatformService.isAndroid) {
              return SheetPage(
                fit: SheetFit.expand,
                duration: $style.durations.sheetTransition,
                decorationBuilder: (context, child) {
                  return SafeArea(
                    bottom: false,
                    left: false,
                    right: false,
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular($style.corners.xxl)),
                      child: child,
                    ),
                  );
                },
                child: builder(context, state),
              );
            }

            return CupertinoSheetPage(
              key: state.pageKey,
              child: builder(context, state),
            );
          },
        );
}
