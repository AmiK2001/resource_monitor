import 'package:pigeon/pigeon.dart';

class ResourseUsageInfo {
  final double appCpuUsage;
  final int appMemoryUsageInBytes;

  ResourseUsageInfo(this.appCpuUsage, this.appMemoryUsageInBytes);
}

@HostApi()
abstract class ResourceMonitorApi {
  @async
  String? getPlatformVersion();

  @async
  ResourseUsageInfo getResourceUsage();
}
