import 'package:flutter/services.dart';

class Flavor {
  final String flavorName;
  final Environment env;

  const Flavor({
    required this.flavorName,
    required this.env,
  });

  factory Flavor.dev() {
    return const Flavor(
      env: Environment.dev,
      flavorName: 'dev',
    );
  }

  factory Flavor.internal() {
    return const Flavor(
      env: Environment.internal,
      flavorName: 'internal',
    );
  }

  factory Flavor.stage() {
    return const Flavor(
      env: Environment.stage,
      flavorName: 'stage',
    );
  }

  factory Flavor.production() {
    return const Flavor(
      env: Environment.prod,
      flavorName: 'production',
    );
  }
}

Future<Flavor> getFlavor() async {
  final flavor = await const MethodChannel('flavor').invokeMethod<String>('getFlavor');
  switch (flavor) {
    case 'dev':
      return Flavor.dev();
    case 'stage':
      return Flavor.stage();
    case 'internal':
      return Flavor.internal();
    case 'production':
      return Flavor.production();
    default:
      throw Exception('Unknown flavor: $flavor');
  }
}

enum Environment {
  dev,
  internal,
  stage,
  prod,
}
