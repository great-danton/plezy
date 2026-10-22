import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    NSLog("PLEZY-PROBE: didFinishLaunchingWithOptions — start")
    let result = super.application(application, didFinishLaunchingWithOptions: launchOptions)
    NSLog("PLEZY-PROBE: didFinishLaunchingWithOptions — end, returning \(result)")
    return result
  }
}
