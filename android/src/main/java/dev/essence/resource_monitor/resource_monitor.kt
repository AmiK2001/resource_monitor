// Autogenerated from Pigeon (v10.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package dev.essence.resource_monitor

import android.util.Log
import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.PluginRegistry.Registrar;


private fun wrapResult(result: Any?): List<Any?> {
  return listOf(result)
}

private fun wrapError(exception: Throwable): List<Any?> {
  if (exception is FlutterError) {
    return listOf(
      exception.code,
      exception.message,
      exception.details
    )
  } else {
    return listOf(
      exception.javaClass.simpleName,
      exception.toString(),
      "Cause: " + exception.cause + ", Stacktrace: " + Log.getStackTraceString(exception)
    )
  }
}

/**
 * Error class for passing custom error details to Flutter via a thrown PlatformException.
 * @property code The error code.
 * @property message The error message.
 * @property details The error details. Must be a datatype supported by the api codec.
 */
class FlutterError (
  val code: String,
  override val message: String? = null,
  val details: Any? = null
) : Throwable()

/** Generated class from Pigeon that represents data sent in messages. */
data class ResourseUsageInfo (
  val appCpuUsage: Double,
  val appMemoryUsageInBytes: Long

) {
  companion object {
    @Suppress("UNCHECKED_CAST")
    fun fromList(list: List<Any?>): ResourseUsageInfo {
      val appCpuUsage = list[0] as Double
      val appMemoryUsageInBytes = list[1].let { if (it is Int) it.toLong() else it as Long }
      return ResourseUsageInfo(appCpuUsage, appMemoryUsageInBytes)
    }
  }
  fun toList(): List<Any?> {
    return listOf<Any?>(
      appCpuUsage,
      appMemoryUsageInBytes,
    )
  }
}

@Suppress("UNCHECKED_CAST")
private object ResourceMonitorApiCodec : StandardMessageCodec() {
  override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
    return when (type) {
      128.toByte() -> {
        return (readValue(buffer) as? List<Any?>)?.let {
          ResourseUsageInfo.fromList(it)
        }
      }
      else -> super.readValueOfType(type, buffer)
    }
  }
  override fun writeValue(stream: ByteArrayOutputStream, value: Any?)   {
    when (value) {
      is ResourseUsageInfo -> {
        stream.write(128)
        writeValue(stream, value.toList())
      }
      else -> super.writeValue(stream, value)
    }
  }
}

/** Generated interface from Pigeon that represents a handler of messages from Flutter. */
interface ResourceMonitorApi {
  fun getPlatformVersion(callback: (Result<String?>) -> Unit)
  fun getResourceUsage(callback: (Result<ResourseUsageInfo>) -> Unit)

  companion object {
    /** The codec used by ResourceMonitorApi. */
    val codec: MessageCodec<Any?> by lazy {
      ResourceMonitorApiCodec
    }
    /** Sets up an instance of `ResourceMonitorApi` to handle messages through the `binaryMessenger`. */
    @Suppress("UNCHECKED_CAST")
    fun setUp(binaryMessenger: BinaryMessenger, api: ResourceMonitorApi?) {
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.ResourceMonitorApi.getPlatformVersion", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            api.getPlatformVersion() { result: Result<String?> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                val data = result.getOrNull()
                reply.reply(wrapResult(data))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.ResourceMonitorApi.getResourceUsage", codec)
        if (api != null) {
          channel.setMessageHandler { _, reply ->
            api.getResourceUsage() { result: Result<ResourseUsageInfo> ->
              val error = result.exceptionOrNull()
              if (error != null) {
                reply.reply(wrapError(error))
              } else {
                val data = result.getOrNull()
                reply.reply(wrapResult(data))
              }
            }
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
    }
  }
}

class ResourceMonitorPlugin : FlutterPlugin, ResourceMonitorApi {
  override fun getPlatformVersion(result: Result<String>?) {
    result?.success("Android ${android.os.Build.VERSION.RELEASE}")
  }

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    ResourceMonitorApi.setup(flutterPluginBinding.binaryMessenger, this)
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    ResourceMonitorApi.setup(binding.binaryMessenger, null)
  }

  override fun getResourceUsage(callback: (Result<ResourseUsageInfo>) -> Unit) {
    TODO("Not yet implemented")
  }

  private fun getCpuUsageByApp() {
  }

  private fun getMemoryUsageByApp() {
    val memInfo: Debug.MemoryInfo = MemoryInfo()
    Debug.getMemoryInfo(memInfo)
    var res: Long = memInfo.getTotalPrivateDirty()

    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) res += memInfo.getTotalPrivateClean()

    return res * 1024L
  }
}