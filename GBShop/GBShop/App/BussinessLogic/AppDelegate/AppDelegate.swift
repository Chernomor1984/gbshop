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
    let requestFactory = RequestFactory()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        login()
        return true
    }
    
    func login() {
        let auth = requestFactory.makeAuthRequestFactory()
        
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
