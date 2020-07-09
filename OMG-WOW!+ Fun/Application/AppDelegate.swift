//
//  AppDelegate.swift
//  OMG-WOW!+ Fun
//
//  Created by Hitesh Trantor on 17/04/20.
//  Copyright © 2020 TrantorSoftware. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let defaults = UserDefaults.standard

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    func applicationWillTerminate(_ application: UIApplication) {
        defaults.set(true, forKey: "startview")
    }
}

