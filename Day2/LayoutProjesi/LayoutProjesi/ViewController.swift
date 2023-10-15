//
//  ViewController.swift
//  LayoutProjesi
//
//  Created by Eken Özlü on 15.10.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var chosenSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad Çağırıldı")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear Çağırıldı")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear Çağırıldı")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear Çağırıldı")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear Çağırıldı")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpsonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let simpson = simpsonArray[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = simpson.name
        content.secondaryText = "Click to see details"
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = simpsonArray[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedSimpson = chosenSimpson
        }
    }
    
}

