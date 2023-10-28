//
//  AppDelegate.swift
//  ProtocolOriented Project
//
//  Created by Eken Özlü on 28.10.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let userService : UserService = APIManager()
        let viewModel = UserViewModel(userService: userService)
        window?.rootViewController = ViewController(userViewModel: viewModel)
        window?.makeKeyAndVisible()
        return true
    }



}

