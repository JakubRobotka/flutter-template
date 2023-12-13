import 'package:package_info_plus/package_info_plus.dart';

class ForceUpdateService {
  final PackageInfo packageInfo;

  ForceUpdateService(this.packageInfo);

  Version get currentVersion => Version(packageInfo.version);

  bool needForce(String version) => Version(version).isGreaterThan(currentVersion);
}

class Version {
  final String version;

  // Parse the version string into its components
  Version(this.version);

  // Major version
  int get major => int.parse(version.split('.')[0]);

  // Minor version
  int get minor => int.parse(version.split('.')[1]);

  // Patch version
  int get patch => int.parse(version.split('.')[2]);

  bool isGreaterThan(Version other) {
    if (major > other.major) {
      return true;
    }
    if (minor > other.minor && major >= other.major) {
      return true;
    }
    if (patch > other.patch && minor >= other.minor && major >= other.major) {
      return true;
    }

    return false;
  }
}
