import 'package:{{ projectName }}/common/services/platform_service.dart';
import 'package:flutter/cupertino.dart';

class AppScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => const ClampingScrollPhysics();

  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) {
    return PlatformService.isAndroid
        ? RawScrollbar(controller: details.controller, child: child)
        : CupertinoScrollbar(controller: details.controller, child: child);
  }
}
