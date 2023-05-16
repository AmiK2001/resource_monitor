import 'package:flutter_test/flutter_test.dart';
import 'package:resource_monitor/resource_monitor_api.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final plugin = ResourceMonitorApi();

  test('getPlatformVersion', () async {
    expect(await plugin.getPlatformVersion(), '42');
  });
}
