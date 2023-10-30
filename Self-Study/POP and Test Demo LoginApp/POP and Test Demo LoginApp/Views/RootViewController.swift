//
//  ViewController.swift
//  POP and Test Demo LoginApp
//
//  Created by Eken Özlü on 30.10.2023.
//

import UIKit

class RootViewController: UIViewController, RootViewModelProtocol {
    
    private let viewModel : RootViewModel
    
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        viewModel.checkLogin()
    }
    
    func createUI() {
        view.backgroundColor = .red
    }
    
    func showMainVC() {
        let mainVC = MainViewController()
        mainVC.modalPresentationStyle = .fullScreen
        present(mainVC, animated: true)
    }

    func showLoginVC() {
        let loginVC = LoginViewController()
        loginVC.modalPresentationStyle = .fullScreen
        present(loginVC, animated: true)
    }

}

