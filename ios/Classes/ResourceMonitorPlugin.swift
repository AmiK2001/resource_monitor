public class ResourceMonitorPlugin: NSObject, FlutterPlugin, ResourceMonitorApi {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger : FlutterBinaryMessenger = registrar.messenger()
        let api : AppUsageApi & NSObjectProtocol = SwiftAppUsagePlugin.init()
        ResourceMonitorApi.setUp(binaryMessenger: messenger, api: api)
    }

    func getPlatformVersion(completion: @escaping (String?) -> Void) {
        completion("iOS " + UIDevice.current.systemVersion)
    }   
}