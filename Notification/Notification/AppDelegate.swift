//
//  AppDelegate.swift
//  Notification
//
//  Created by Григоренко Александр Игоревич on 30.12.2022.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var center: UNUserNotificationCenter?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        getPermissions()
        return true
    }

    private func getPermissions(){
        center = UNUserNotificationCenter.current()
        guard let center =  center else { return }
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granded, error in
            guard granded else { return }
            self.sendNotificationRequest(content: self.makeNotificationContent(), trigger: self.makeIntervalNotificationTrigger())
        }
    }

    private func makeNotificationContent() -> UNNotificationContent {
        let content = UNMutableNotificationContent()
        content.title = "WAAAAAAAGHHHH!!!"
        content.subtitle = "ПАРА СТУКАТЬ ЮДИШЕК!!!"
        content.body = "НЕ ЗАБУДЬ ВЫПЫТЬ ГРЫБНОГО ПЫВА"
        content.badge = 4
        return content
    }

    private func makeIntervalNotificationTrigger() -> UNNotificationTrigger {
        return UNTimeIntervalNotificationTrigger(timeInterval: 20, repeats: false)
    }

    private func sendNotificationRequest(content: UNNotificationContent, trigger: UNNotificationTrigger) {
        let request = UNNotificationRequest(identifier: "alarm", content: content, trigger: trigger)
        center?.add(request, withCompletionHandler: { error in
            guard let error = error else { return }
            print(error)
        })
    }
}

