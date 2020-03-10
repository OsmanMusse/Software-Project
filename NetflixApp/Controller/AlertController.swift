//
//  AlertController.swift
//  NetflixApp
//
//  Created by Mezut on 18/07/2019.
//  Copyright © 2019 Mezut. All rights reserved.
//

import UIKit

class AlertController: UIAlertController {
    
    var customView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(customView)
        
        setupDesigns()

        view.backgroundColor = .red
    }
    
    func setupDesigns(){
        NSLayoutConstraint.activate([
               customView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               customView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
               customView.heightAnchor.constraint(equalToConstant: 100),
               customView.widthAnchor.constraint(equalToConstant: 100),
            ])
    }
    


}
