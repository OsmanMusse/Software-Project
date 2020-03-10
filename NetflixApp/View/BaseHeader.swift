//
//  BaseHeader.swift
//  NetflixApp
//
//  Created by Mezut on 25/07/2019.
//  Copyright © 2019 Mezut. All rights reserved.
//

import UIKit



class BaseHeader: UICollectionViewCell {
        
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "My List"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout(){
        addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            
            headerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            headerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            
            ])
    }
        
        
    }
    

