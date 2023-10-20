//
//  ViewController.swift
//  URLSession Demo
//
//  Created by Eken Özlü on 20.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel! //CAD
    @IBOutlet weak var label2: UILabel! //CHF
    @IBOutlet weak var label3: UILabel! //GBP
    @IBOutlet weak var label4: UILabel! //USD
    @IBOutlet weak var label5: UILabel! //TRY
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func fetchClicked(_ sender: Any) {
        let apiURL = URL(string: "http://data.fixer.io/api/latest?access_key=4a990ae1cc0ef5a920e4c7e9eeb1123c")
        let request = URLRequest(url: apiURL!)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, error == nil {
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as! Dictionary<String, Any>
                    let rates = jsonResponse["rates"] as! [String : Any]
                    DispatchQueue.main.async {
                        self.label1.text = "CAD: \(rates["CAD"] ?? "")"
                        self.label2.text = "CHF: \(rates["CHF"] ?? "")"
                        self.label3.text = "GBP: \(rates["GBP"] ?? "")"
                        self.label4.text = "USD: \(rates["USD"] ?? "")"
                        self.label5.text = "TRY: \(rates["TRY"] ?? "")"
                    }
                    
                } catch {
                    print("Error on serialization")
                }
                
            } else {
                let ac = UIAlertController(title: "ALERT", message: error?.localizedDescription, preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(ac, animated: true)
            }
        }.resume()
    }
    
}

