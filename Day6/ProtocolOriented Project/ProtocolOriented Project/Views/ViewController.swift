//
//  ViewController.swift
//  ProtocolOriented Project
//
//  Created by Eken Özlü on 28.10.2023.
//

import UIKit

class ViewController: UIViewController, UserViewModelOutput{
    
    private var userViewModel : UserViewModel
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let usernameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let emailLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    
    init(userViewModel: UserViewModel) {
        self.userViewModel = userViewModel
        super.init(nibName: nil, bundle: nil)
        self.userViewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        userViewModel.fetchUsers()
    }
    
    func createUI() {
        view.backgroundColor = .red
        
        view.addSubview(nameLabel)
        view.addSubview(usernameLabel)
        view.addSubview(emailLabel)
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                                     nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     nameLabel.heightAnchor.constraint(equalToConstant: 70),
                                     nameLabel.widthAnchor.constraint(equalToConstant: 200),
                                     
                                     usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
                                     usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     usernameLabel.heightAnchor.constraint(equalToConstant: 70),
                                     usernameLabel.widthAnchor.constraint(equalToConstant: 200),
                                     
                                     emailLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 16),
                                     emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     emailLabel.heightAnchor.constraint(equalToConstant: 70),
                                     emailLabel.widthAnchor.constraint(equalToConstant: 200)])
    }
    
    func updateView(name: String, username: String, email: String) {
        self.nameLabel.text = name
        self.usernameLabel.text = username
        self.emailLabel.text = email
    }
    
    
}

