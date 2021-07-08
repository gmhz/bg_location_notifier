package com.example.bgtracker

import com.dexterous.flutterlocalnotifications.FlutterLocalNotificationsPlugin
import io.flutter.app.FlutterApplication
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin
import io.flutter.view.FlutterMain

class MyApplication : FlutterApplication(), PluginRegistry.PluginRegistrantCallback {
    override fun onCreate() {
        super.onCreate()
        FlutterMain.startInitialization(this)
    }

    override fun registerWith(registry: PluginRegistry?) {
        if (!registry!!.hasPlugin("io.flutter.plugins.sharedpreferences")) {
            SharedPreferencesPlugin.registerWith(registry!!.registrarFor("io.flutter.plugins.sharedpreferences"))
        }
        if (!registry.hasPlugin("com.dexterous.flutterlocalnotifications")) {
            FlutterLocalNotificationsPlugin.registerWith(registry!!.registrarFor("com.dexterous.flutterlocalnotifications"))
        }
    }
}