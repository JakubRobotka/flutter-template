import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:{{ projectName }}/common/constants/remote_config_constants.dart';
import 'package:{{ projectName }}/common/router/router.dart';
import 'package:{{ projectName }}/common_libs.dart';
import 'package:{{ projectName }}/injector.dart';

Future<void> bootstrap(Widget Function() builder) async {
  await initInjector();
  final CrashlyticsService crashlyticsService = injector<CrashlyticsService>();

  FlutterError.onError = crashlyticsService.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    crashlyticsService.instance.recordError(error, stack, fatal: true);
    return true;
  };

  if (kDebugMode) {
    unawaited(crashlyticsService.disable());
  }

  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ),
  );
  await remoteConfig.fetchAndActivate();

  Bloc.observer = const AppBlocObserver();

  runApp(builder());

  if (remoteConfig.getBool(RemoteConfigConstants.maintenance)) {
    appRouter.go(ScreenPaths.maintenance);
  } else if (injector<ForceUpdateService>().needForce(remoteConfig.getString(RemoteConfigConstants.minVersion))) {
    appRouter.go(ScreenPaths.forceUpdate);
  } else {
    appRouter.go(ScreenPaths.homepage);
  }
}

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
  }
}
