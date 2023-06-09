// Autogenerated from Pigeon (v10.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif

public typealias MemoryUsage = (used: UInt64, total: UInt64)

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)"
  ]
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

/// Generated class from Pigeon that represents data sent in messages.
struct ResourseUsageInfo {
  var appCpuUsage: Double
  var appMemoryUsageInBytes: Int64

  static func fromList(_ list: [Any?]) -> ResourseUsageInfo? {
    let appCpuUsage = list[0] as! Double
    let appMemoryUsageInBytes = list[1] is Int64 ? list[1] as! Int64 : Int64(list[1] as! Int32)

    return ResourseUsageInfo(
      appCpuUsage: appCpuUsage,
      appMemoryUsageInBytes: appMemoryUsageInBytes
    )
  }
  func toList() -> [Any?] {
    return [
      appCpuUsage,
      appMemoryUsageInBytes,
    ]
  }
}

private class ResourceMonitorApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 128:
        return ResourseUsageInfo.fromList(self.readValue() as! [Any?])
      default:
        return super.readValue(ofType: type)
    }
  }
}

private class ResourceMonitorApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? ResourseUsageInfo {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class ResourceMonitorApiCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return ResourceMonitorApiCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return ResourceMonitorApiCodecWriter(data: data)
  }
}

class ResourceMonitorApiCodec: FlutterStandardMessageCodec {
  static let shared = ResourceMonitorApiCodec(readerWriter: ResourceMonitorApiCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol ResourceMonitorApi {
  func getPlatformVersion(completion: @escaping (Result<String?, Error>) -> Void)
  func getResourceUsage(completion: @escaping (Result<ResourseUsageInfo, Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class ResourceMonitorApiSetup {
  /// The codec used by ResourceMonitorApi.
  static var codec: FlutterStandardMessageCodec { ResourceMonitorApiCodec.shared }
  /// Sets up an instance of `ResourceMonitorApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: ResourceMonitorApi?) {
    let getPlatformVersionChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.ResourceMonitorApi.getPlatformVersion", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getPlatformVersionChannel.setMessageHandler { _, reply in
        api.getPlatformVersion() { result in
          switch result {
            case .success(let res):
              reply(wrapResult(res))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      getPlatformVersionChannel.setMessageHandler(nil)
    }
    let getResourceUsageChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.ResourceMonitorApi.getResourceUsage", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getResourceUsageChannel.setMessageHandler { _, reply in
        api.getResourceUsage() { result in
          switch result {
            case .success(let res):
              reply(wrapResult(res))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      getResourceUsageChannel.setMessageHandler(nil)
    }
  }
}