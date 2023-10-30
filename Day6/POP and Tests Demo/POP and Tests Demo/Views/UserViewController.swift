//
//  ViewController.swift
//  POP and Tests Demo
//
//  Created by Eken Özlü on 30.10.2023.
//

import UIKit

class UserViewController: UIViewController, UserViewModelProtocol {
    
    private let viewModel : UserViewModel
    
    private let nameLabel = UILabel()
    private let usernameLabel = UILabel()
    private let emailLabel = UILabel()
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        viewModel.fetchUsers()
    }
    
    func createUI() {
        view.backgroundColor = .white
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .center
        view.addSubview(nameLabel)
        NSLayoutConstraint.activate([nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
                                     nameLabel.heightAnchor.constraint(equalToConstant: 25)])
        
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.textAlignment = .center
        view.addSubview(usernameLabel)
        NSLayoutConstraint.activate([usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
                                     usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     usernameLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor, multiplier: 1),
                                     usernameLabel.heightAnchor.constraint(equalToConstant: 25)])
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.textAlignment = .center
        view.addSubview(emailLabel)
        NSLayoutConstraint.activate([emailLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 16),
                                     emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     emailLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor, multiplier: 1),
                                     emailLabel.heightAnchor.constraint(equalToConstant: 25)])
    }
    
    func updateView(name: String, username: String, email: String) {
        DispatchQueue.main.async {
            self.nameLabel.text = name
            self.usernameLabel.text = username
            self.emailLabel.text = email
        }
    }
    
}

