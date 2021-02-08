//
//  AppDelegate.swift
//  NEProTest
//
//  Created by LuLuLu on 2021/2/8.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
   var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

