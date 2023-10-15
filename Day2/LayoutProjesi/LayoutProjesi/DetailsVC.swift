//
//  DetailsVC.swift
//  LayoutProjesi
//
//  Created by Eken Özlü on 15.10.2023.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var selectedSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: selectedSimpson?.imageName ?? "")
        nameLabel.text = selectedSimpson?.name
        jobLabel.text = selectedSimpson?.job
        ageLabel.text = "\(selectedSimpson?.age ?? 0)"
        
    }

}
