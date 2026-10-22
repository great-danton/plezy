import Flutter
import UIKit

@objc class PlezyFlutterViewController: FlutterViewController {
  override var canBecomeFirstResponder: Bool { true }

  override func viewDidLoad() {
    super.viewDidLoad()
    NSLog("PLEZY-PROBE: PlezyFlutterViewController.viewDidLoad")
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    becomeFirstResponder()
    NSLog("PLEZY-PROBE: PlezyFlutterViewController.viewDidAppear")
  }
}

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    NSLog("PLEZY-PROBE: AppDelegate didFinishLaunching — start")
    let result = super.application(application, didFinishLaunchingWithOptions: launchOptions)
    NSLog("PLEZY-PROBE: AppDelegate didFinishLaunching — end, returning \(result)")
    return result
  }

  // Deliberately empty — no plugins registered. Prints to confirm we got here.
  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    NSLog("PLEZY-PROBE: didInitializeImplicitFlutterEngine — called, registering nothing")
  }
}
