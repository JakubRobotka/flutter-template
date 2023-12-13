import 'package:{{ projectName }}/common/flavor/flavor.dart';
import 'package:{{ projectName }}/common/services/crashlytics_service.dart';
import 'package:{{ projectName }}/common/services/force_update_service.dart';
import 'package:{{ projectName }}/common/services/storage_service.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt injector = GetIt.instance;

Future<void> initInjector() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final Flavor flavor = await getFlavor();
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final StorageService storageService = StorageService(sharedPreferences);

  injector.registerSingleton<StorageService>(storageService);
  injector.registerSingleton<CrashlyticsService>(CrashlyticsService(FirebaseCrashlytics.instance));
  injector.registerSingleton<Flavor>(flavor);
  injector.registerSingleton<PackageInfo>(packageInfo);
  injector.registerSingleton<ForceUpdateService>(ForceUpdateService(packageInfo));
}
