import UIKit
import EventKit
import EventKitUI
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, EKEventEditViewDelegate {
    
    override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
      
        if let controller = window.rootViewController as? FlutterViewController,
         let id = Bundle.main.bundleIdentifier
        {
          FlutterMethodChannel(name: "\(id).method_channel", binaryMessenger: controller.binaryMessenger).setMethodCallHandler(onMethodCall)
        }

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func onMethodCall(call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch (call.method) {
        case "calendarEvent":
            guard let arguments = call.arguments as? [String: Any],
                  let title = arguments["title"] as? String,
                  let start = arguments["start"] as? Double,
                  let end = arguments["end"] as? Double else {
                result(false)
                return
            }
            let eventStore = EKEventStore()
            eventStore.requestAccess(to: .event) { (granted, error) in
                DispatchQueue.main.async {
                    if granted && error == nil {
                        let event = EKEvent(eventStore: eventStore)
                        event.title = title
                        event.startDate = Date(timeIntervalSince1970: start / 1000)
                        event.endDate = Date(timeIntervalSince1970: end / 1000)
                        event.location = arguments["location"] as? String
                        let controller = EKEventEditViewController()
                        controller.event = event
                        controller.eventStore = eventStore
                        controller.editViewDelegate = self
                        let topViewController = UIApplication.topViewController()
                        topViewController?.present(controller, animated: true)
                        result(true)
                    } else {
                        result(false)
                    }
                }
            }
        case "isJailbreak":
            let isRoot = CheckRoot()
            result(isRoot.isRoot)
        default: break
        }
    }
    
    
    // MARK: - EKEventEditViewDelegate
    
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        controller.dismiss(animated: true)
    }
    
}
