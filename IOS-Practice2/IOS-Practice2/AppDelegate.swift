//
//  AppDelegate.swift
//  IOS-Practice2
//
//  Created by June on 2022/11/01.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController =  UINavigationController(rootViewController: MainViewController())
        window?.makeKeyAndVisible()
        return true
    }



}

