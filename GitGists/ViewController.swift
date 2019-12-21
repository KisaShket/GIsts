//
//  ViewController.swift
//  GitGists
//
//  Created by Miska  on 20/12/2019.
//  Copyright © 2019 Miska . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var updatedAtLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    var descrToEdit:String? = nil
    var createdAtToEdit:String? = nil
    var updatedAtToEdit:String? = nil
    var urlToEdit:String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 2
        urlLabel.lineBreakMode = .byWordWrapping
        urlLabel.numberOfLines = 2
    }
    
    private func setupLabels(){
        descriptionLabel.text = descrToEdit
        createdAtLabel.text = createdAtToEdit
        updatedAtLabel.text = updatedAtToEdit
        urlLabel.text = urlToEdit
    }
    
}
