import 'package:{{ projectName }}/app/cubit/app_cubit.dart';
import 'package:{{ projectName }}/common/router/router.dart';
import 'package:{{ projectName }}/common/services/crashlytics_service.dart';
import 'package:{{ projectName }}/common/services/storage_service.dart';
import 'package:{{ projectName }}/common/theme/app_theme.dart';
import 'package:{{ projectName }}/common_libs.dart';
import 'package:{{ projectName }}/injector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  factory App.builder() {
    return const App();
  }

  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<StorageService>.value(
          value: injector<StorageService>(),
        ),
        RepositoryProvider<CrashlyticsService>.value(
          value: injector<CrashlyticsService>(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppCubit>(
            create: (context) => AppCubit(
              storageService: injector<StorageService>(),
              defaultLocale: AppLocalizations.supportedLocales.first,
            ),
          ),
        ],
        child: BlocConsumer<AppCubit, AppState>(
          listenWhen: (previous, current) => previous.locationState != current.locationState,
          buildWhen: (previous, current) => previous.locale != current.locale,
          listener: (context, state) {
            if (state.locationState == AppLocationState.ready) {
              appRouter.go(ScreenPaths.homepage);
            }
            if (state.locationState == AppLocationState.needForceUpdate) {
              appRouter.go(ScreenPaths.forceUpdate);
            }
            if (state.locationState == AppLocationState.maintenance) {
              appRouter.go(ScreenPaths.maintenance);
            }
          },
          builder: (context, state) {
            return MaterialApp.router(
              routeInformationProvider: appRouter.routeInformationProvider,
              routeInformationParser: appRouter.routeInformationParser,
              routerDelegate: appRouter.routerDelegate,
              theme: AppTheme.themeData,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale?.languageCode &&
                      supportedLocale.countryCode == locale?.countryCode) {
                    return supportedLocale;
                  }
                }
                return AppLocalizations.supportedLocales.first;
              },
            );
          },
        ),
      ),
    );
  }
}
