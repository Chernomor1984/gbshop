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
        registration()
        return true
    }
    
    func login() {
        let authFactory = requestFactory.makeAuthRequestFactory()
        
        authFactory.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func registration() {
        let registrationFactory = requestFactory.makeRegistrationRequestFactory()
        let registrationParams = RegistrationParams(userID: 123,
                                                    username: "Somebody",
                                                    password: "mypassword",
                                                    email: "some@some.ru",
                                                    gender: "m",
                                                    creditCardNumber: "9872389-2424-234224-234",
                                                    bio: "This is good! I think I will switch to another language")
        
        registrationFactory.registerUser(params: registrationParams) { (response) in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
