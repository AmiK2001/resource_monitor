import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resource_monitor/resource_monitor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  test('getPlatformVersion', () async {
    ResourceMonitor resourceMonitorPlugin = ResourceMonitor();

    expect(await resourceMonitorPlugin.getPlatformVersion(), '42');
  });
}
