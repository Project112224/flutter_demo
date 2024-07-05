package com.example.flutter_demo

import android.annotation.SuppressLint
import android.content.Intent
import android.provider.CalendarContract
import android.provider.Settings.Secure
import com.example.module.CheckRoot
import com.example.flutter_demo.BuildConfig
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity(), MethodChannel.MethodCallHandler {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "${BuildConfig.APPLICATION_ID}.method_channel"
        ).setMethodCallHandler(this)
    }

    @SuppressLint("QueryPermissionsNeeded")
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "calendarEvent" -> {
                val title = call.argument<String>("title") ?: return result.success(false)
                val start = call.argument<Long>("start") ?: return result.success(false)
                val end = call.argument<Long>("end") ?: return result.success(false)
                val location = call.argument<String>("location")
                val intent =
                    Intent(Intent.ACTION_INSERT, CalendarContract.Events.CONTENT_URI).apply {
                        setPackage("com.google.android.calendar")
                        putExtra(CalendarContract.Events.TITLE, title)
                        putExtra(CalendarContract.EXTRA_EVENT_BEGIN_TIME, start)
                        putExtra(CalendarContract.EXTRA_EVENT_END_TIME, end)
                        putExtra(CalendarContract.Events.EVENT_LOCATION, location)
                    }
                if (intent.resolveActivity(packageManager) != null) {
                    startActivity(intent)
                    result.success(true)
                } else {
                    result.success(false)
                }
            }
            "isJailbreak" -> {
                val isRoot = CheckRoot()
                result.success(isRoot.isRoot())
            }
            "deviceID" -> {
                val androidID = Secure.getString(
                    context.contentResolver,
                    Secure.ANDROID_ID,
                )
                result.success(androidID)
            }
            else -> {
                result.notImplemented()
            }
        }
    }
}
