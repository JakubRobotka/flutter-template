import 'package:{{ projectName }}/app/app_scaffold.dart';

export 'package:flutter/material.dart';
export 'package:go_router/go_router.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:equatable/equatable.dart';

export 'package:{{ projectName }}/l10n/localizations.dart';
import 'package:{{ projectName }}/common/theme/app_style.dart';
export 'package:{{ projectName }}/common/theme/app_style.dart';

export 'package:{{ projectName }}/common/services/crashlytics_service.dart';
export 'package:{{ projectName }}/common/services/force_update_service.dart';
export 'package:{{ projectName }}/common/services/platform_service.dart';
export 'package:{{ projectName }}/common/services/storage_service.dart';

AppStyle get $style => AppScaffold.style;
