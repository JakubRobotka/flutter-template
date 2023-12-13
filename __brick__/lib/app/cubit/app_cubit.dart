import 'package:{{ projectName }}/common/services/storage_service.dart';
import 'package:{{ projectName }}/common_libs.dart';

enum AppLocationState {
  initial,
  ready,
  needForceUpdate,
  maintenance,
}

class AppState extends Equatable {
  final Locale locale;
  final AppLocationState locationState;

  const AppState({
    required this.locale,
    this.locationState = AppLocationState.initial,
  });

  AppState copyWith({
    Locale? locale,
    AppLocationState? locationState,
  }) {
    return AppState(
      locale: locale ?? this.locale,
      locationState: locationState ?? this.locationState,
    );
  }

  @override
  List<Object?> get props => [locale, locationState];
}

class AppCubit extends Cubit<AppState> {
  final StorageService storageService;
  final Locale defaultLocale;

  AppCubit({
    required this.storageService,
    required this.defaultLocale,
  }) : super(
          AppState(
            locale: storageService.getLocale() ?? defaultLocale,
          ),
        );

  void setLocale(Locale locale) {
    storageService.setLocale(locale);
    emit(state.copyWith(locale: locale));
  }
}
