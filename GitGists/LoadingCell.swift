//
//  LoadingCell.swift
//  GitGists
//
//  Created by Miska  on 20/12/2019.
//  Copyright © 2019 Miska . All rights reserved.
//

import UIKit
//MARK:- Ячейка с индикаотором закгрузки
class LoadingCell : UITableViewCell {
    var activityIndicator: UIActivityIndicatorView!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    private func setupSubviews() {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.style = .gray
        indicator.hidesWhenStopped = true
        
        contentView.addSubview(indicator)
        
        NSLayoutConstraint.activate([
            indicator.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            indicator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            indicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
        
        indicator.startAnimating()
    }
}
