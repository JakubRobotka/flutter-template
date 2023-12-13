import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class CrashlyticsService {
  final FirebaseCrashlytics instance;

  CrashlyticsService(this.instance);

  FirebaseCrashlytics get crashlytics => instance;

  recordError({
    dynamic exception,
    StackTrace? stackTrace,
  }) {
    instance.recordError(exception, stackTrace, fatal: true);
  }

  Future<void> disable() async {
    await instance.setCrashlyticsCollectionEnabled(false);
  }
}
