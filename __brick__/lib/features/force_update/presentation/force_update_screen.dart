import 'package:{{ projectName }}/common_libs.dart';

class ForceUpdateScreen extends StatelessWidget {
  const ForceUpdateScreen({super.key});

  factory ForceUpdateScreen.routeBuilder(
    BuildContext _,
    GoRouterState state,
  ) {
    return const ForceUpdateScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('ForceUpdateScreen'),
    );
  }
}
