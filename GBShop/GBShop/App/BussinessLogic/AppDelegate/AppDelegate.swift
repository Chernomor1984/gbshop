//
//  AppDelegate.swift
//  GBShop
//
//  Created by Eugene Khizhnyak on 03.07.2018.
//  Copyright © 2018 Chernomor. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIFactory().loadAuthViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}
