import 'package:{{ projectName }}/app/app.dart';
import 'package:{{ projectName }}/bootstrap.dart';
import 'package:{{ projectName }}/common_libs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp();
  await bootstrap(App.builder);

  FlutterNativeSplash.remove();
}
