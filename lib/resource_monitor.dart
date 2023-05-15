import 'package:resource_monitor/resource_monitor_api.dart';

abstract interface class IResourceMonitor {
  Future<ResourseUsageInfo> getResourceUsage();
  Stream<ResourseUsageInfo> getResourceUsageStream();
}

class ResourceMonitor extends IResourceMonitor {
  final ResourceMonitorApi _instance = ResourceMonitorApi();

  @override
  Future<ResourseUsageInfo> getResourceUsage() {
    return _instance.getResourceUsage();
  }

  Future<String?> getPlatformVersion() async {
    return _instance.getPlatformVersion();
  }

  @override
  Stream<ResourseUsageInfo> getResourceUsageStream({
    Duration pollingRate = const Duration(seconds: 1),
  }) {
    return Stream.periodic(pollingRate).asyncMap((_) => getResourceUsage());
  }
}
