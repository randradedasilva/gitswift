//
//  AppDelegate.swift
//  gitswift
//
//  Created by Rodrigo Andrade on 06/10/19.
//  Copyright © 2019 Rodrigo Andrade. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        let repositoryViewController = RepositoryViewController()
        let navigationViewController = UINavigationController(rootViewController: repositoryViewController)
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
        return true
    }
}
