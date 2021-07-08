import UIKit
import Flutter
import background_locator
import flutter_local_notifications

func registerPlugins(registry: FlutterPluginRegistry) -> () {
    if (!registry.hasPlugin("BackgroundLocatorPlugin")) {
        GeneratedPluginRegistrant.register(with: registry)
    }
}

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    BackgroundLocatorPlugin.setPluginRegistrantCallback(registerPlugins)

    registerOtherPlugins()

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

    func registerOtherPlugins() {
        if !hasPlugin("com.dexterous.flutterlocalnotifications") {
            FlutterLocalNotificationsPlugin
                .register(with: registrar(forPlugin: "com.dexterous.flutterlocalnotifications")!)
        }

        if !hasPlugin("io.flutter.plugins.sharedpreferences") {
            FlutterLocalNotificationsPlugin.register(with: registrar(forPlugin: "io.flutter.plugins.sharedpreferences")!)
        }
    }
}
