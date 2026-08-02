package com.emadelfara.masrofy

import android.content.Intent
import android.net.Uri
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val CHANNEL = "masrofy/native"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->

            when (call.method) {

                "openUrl" -> {
                    val url = call.argument<String>("url")

                    if (url == null) {
                        result.error(
                            "INVALID_URL",
                            "URL is null",
                            null
                        )
                        return@setMethodCallHandler
                    }

                    try {

                        val intent = if (url.startsWith("mailto:")) {
                            Intent(Intent.ACTION_SENDTO).apply {
                                data = Uri.parse(url)
                            }
                        } else {
                            Intent(Intent.ACTION_VIEW).apply {
                                data = Uri.parse(url)
                            }
                        }

                        if (intent.resolveActivity(packageManager) != null) {
                            startActivity(intent)
                            result.success(true)
                        } else {
                            result.error(
                                "NO_APP",
                                "No application found to handle this link.",
                                null
                            )
                        }

                    } catch (e: Exception) {
                        result.error(
                            "OPEN_URL_ERROR",
                            e.localizedMessage,
                            null
                        )
                    }
                }

                else -> result.notImplemented()
            }
        }
    }
}