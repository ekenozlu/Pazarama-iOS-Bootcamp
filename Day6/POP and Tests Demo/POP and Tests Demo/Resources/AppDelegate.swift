//
//  AppDelegate.swift
//  POP and Tests Demo
//
//  Created by Eken Özlü on 30.10.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let userService : UserAPIService = APIManager()
        let viewModel = UserViewModel(userService: userService)
        window?.rootViewController = UserViewController(viewModel: viewModel)
        window?.makeKeyAndVisible()
        return true
    }

}

