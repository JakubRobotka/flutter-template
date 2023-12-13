import 'package:{{ projectName }}/common_libs.dart';
import 'package:{{ projectName }}/widgets/behavior/app_scroll_behavior.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  static AppStyle _style = AppStyle();

  static AppStyle get style => _style;

  const AppScaffold({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    _style = AppStyle(defaultScreenSize: MediaQuery.of(context).size);

    return ScrollConfiguration(
      behavior: AppScrollBehavior().copyWith(scrollbars: false),
      child: child,
    );
  }
}
