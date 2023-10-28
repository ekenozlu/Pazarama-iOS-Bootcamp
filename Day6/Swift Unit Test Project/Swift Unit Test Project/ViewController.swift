//
//  ViewController.swift
//  Swift Unit Test Project
//
//  Created by Eken Özlü on 28.10.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var toDoList = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "todoCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
    }

    @IBAction func addButtonClicked(_ sender: Any) {
        let ac = UIAlertController(title: "Add To-Do", message: "Add your details", preferredStyle: .alert)
        ac.addTextField { tf in
            tf.placeholder = "To Do"
        }
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            guard let textField = ac.textFields?.first, let inputText = textField.text, !inputText.isEmpty else {
                return
            }
            self.toDoList.insert(inputText, at: 0)
            self.tableView.reloadData()
            ac.dismiss(animated: true)
        }))
        present(ac, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.toDoList.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
}

