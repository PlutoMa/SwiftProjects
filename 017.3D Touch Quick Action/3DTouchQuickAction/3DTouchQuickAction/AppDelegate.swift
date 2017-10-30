//
//  AppDelegate.swift
//  3DTouchQuickAction
//
//  Created by Dareway on 2017/10/30.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if self.window?.traitCollection.forceTouchCapability == .available {
            setup3DTouch(app: application)
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ShortcutAction"), object: nil, userInfo: ["shortcutItem" : shortcutItem])
    }

    func setup3DTouch(app: UIApplication) -> Void {
        let loveActionIcon = UIApplicationShortcutIcon(type: .love)
        let loveItem = UIApplicationShortcutItem(type: "LoveItem", localizedTitle: "LoveAction", localizedSubtitle: nil, icon: loveActionIcon, userInfo: nil)
        app.shortcutItems = [loveItem]
    }

}

