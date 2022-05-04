//
//  imageViewController.swift
//  MyLendmarkBookApp
//
//  Created by Toygun Çil on 4.05.2022.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet weak var lendmarkLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedLendmakName = ""
    var selectedLendmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lendmarkLabel.text = selectedLendmakName
        imageView.image = selectedLendmarkImage
    }
}
