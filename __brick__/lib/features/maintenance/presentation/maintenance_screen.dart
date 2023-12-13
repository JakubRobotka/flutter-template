import 'package:{{ projectName }}/common_libs.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  factory MaintenanceScreen.routeBuilder(
    BuildContext _,
    GoRouterState state,
  ) {
    return const MaintenanceScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('MaintenanceScreen'),
      ),
    );
  }
}
