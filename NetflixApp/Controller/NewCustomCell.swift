//
//  CustomCell.swift
//  NetflixApp
//
//  Created by Mezut on 23/07/2019.
//  Copyright © 2019 Mezut. All rights reserved.
//

import UIKit

class newCustomCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
   
    let cellId = "cellId"
    
    let CustomCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
       let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        cv.backgroundColor = .red
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    var label: UILabel = {
       let label = UILabel()
        label.text = "Mascuud"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        CustomCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        CustomCollectionView.dataSource = self
        CustomCollectionView.delegate = self
        
        addSubview(label)
        addSubview(CustomCollectionView)
        setupLayout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width / 4, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    func setupLayout(){
       
        NSLayoutConstraint.activate([
            
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            CustomCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            CustomCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            CustomCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            CustomCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            
            ])
    }
    
    
    
    
}
