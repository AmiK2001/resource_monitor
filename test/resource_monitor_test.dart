import 'package:flutter_test/flutter_test.dart';
import 'package:resource_monitor/resource_monitor.dart';
import 'package:resource_monitor/resource_monitor_platform_interface.dart';
import 'package:resource_monitor/resource_monitor_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockResourceMonitorPlatform
    with MockPlatformInterfaceMixin
    implements ResourceMonitorPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ResourceMonitorPlatform initialPlatform = ResourceMonitorPlatform.instance;

  test('$MethodChannelResourceMonitor is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelResourceMonitor>());
  });

  test('getPlatformVersion', () async {
    ResourceMonitor resourceMonitorPlugin = ResourceMonitor();
    MockResourceMonitorPlatform fakePlatform = MockResourceMonitorPlatform();
    ResourceMonitorPlatform.instance = fakePlatform;

    expect(await resourceMonitorPlugin.getPlatformVersion(), '42');
  });
}
