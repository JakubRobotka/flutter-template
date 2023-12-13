import 'package:{{ projectName }}/common_libs.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  factory HomepageScreen.routeBuilder(
    BuildContext _,
    GoRouterState state,
  ) {
    return const HomepageScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('HomepageScreen'),
      ),
    );
  }
}
