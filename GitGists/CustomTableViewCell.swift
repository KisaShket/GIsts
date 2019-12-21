//
//  CustomTableViewCell.swift
//  GitGists
//
//  Created by Miska  on 20/12/2019.
//  Copyright © 2019 Miska . All rights reserved.
//

import UIKit

//MARK:-Реализация нажатия баттона с передачей индекса
protocol cellNew {
    func onClickCell(index:IndexPath)
}

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descriptionGist: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var shadowView: UIView!
    
    var cellDelegate: cellNew?
    var index: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupBodyView()
        setupShadowView()
        descriptionGist.lineBreakMode = .byWordWrapping
        descriptionGist.numberOfLines = 2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    private func setupShadowView() {
        shadowView.backgroundColor = UIColor.clear
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowRadius = 2.6
        shadowView.layer.shadowOffset = CGSize(width: 3, height: 3)
    }
    private func setupBodyView() {
        bodyView.layer.cornerRadius = 14.0
        bodyView.clipsToBounds = true
    }
    
    @IBAction func toTheDetails(_ sender: Any) {
        cellDelegate?.onClickCell(index: index!)
    }
    
}
