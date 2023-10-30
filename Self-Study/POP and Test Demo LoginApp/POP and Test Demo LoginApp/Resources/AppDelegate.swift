//
//  AppDelegate.swift
//  POP and Test Demo LoginApp
//
//  Created by Eken Özlü on 30.10.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let loginStorageService : LoginStorageService = LoginStorageServiceImpl()
        let viewModel = RootViewModel(loginStorageService: loginStorageService)
        window?.rootViewController = RootViewController(viewModel: viewModel)
        window?.makeKeyAndVisible()
        return true
    }


}

