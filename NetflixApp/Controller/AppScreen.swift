//
//  ModalController.swift
//  NetflixApp
//
//  Created by Mezut on 18/07/2019.
//  Copyright © 2019 Mezut. All rights reserved.
//

import UIKit




class AppScreen: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    lazy var customCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.dataSource = self
        cv.delegate = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    var videoInfo: [VideoData] = {
         var video1 = VideoData()
         video1.Image = UIImage(named:"bodyguard")
        
        var video2 = VideoData()
        video2.Image = UIImage(named: "suit")
        
        return [video1,video2]
    }()
    
    
    
  
    let padding: CGFloat = 6
    
    let seriesBtn: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Series", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let filmsBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Films", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let myListBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("My List", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
 
    
    
    var customCellId = "customCellId"
    var headerCellId = "headerCellId"
    var popularCellId = "popularCellId"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.hidesBarsOnSwipe = true

         collectionView.backgroundColor = UIColor(red: 24/255, green: 24/255, blue: 25/255, alpha: 1)

       
        tabBarController?.tabBar.tintColor = .white
        tabBarController?.tabBar.barTintColor = .black
        tabBarController?.tabBar.isTranslucent = false
        
        // Remove transparency to the tabbar
        
        
        setupNavBar()
        setupLayout()
        setupCollectionView()
   
    }
    
    func setupNavBar(){
        
        
        let netflixLogo = UIBarButtonItem(image: #imageLiteral(resourceName: "netflix (1)").withRenderingMode(.alwaysOriginal), style: .plain, target: nil, action: nil)
        netflixLogo.imageInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        
        
        var label = UIBarButtonItem(title: "hadsa", style: .plain, target: nil, action: nil)
        
        let sview = UIStackView(arrangedSubviews: [seriesBtn,filmsBtn,myListBtn])
        sview.axis = .horizontal
        sview.alignment = .center
        sview.spacing = 50
        sview.distribution = .fillEqually
        sview.translatesAutoresizingMaskIntoConstraints = false
        
        let customView = UIBarButtonItem(customView: sview)
          self.navigationController?.navigationBar.backgroundColor = .red

        navigationItem.setRightBarButtonItems([customView], animated: false)
    
        
        
        navigationItem.leftBarButtonItem = netflixLogo

        
        // Hide the default back button
        navigationItem.hidesBackButton = true
   
        navigationController?.navigationBar.barTintColor = UIColor(red: 24/255, green: 24/255, blue: 25/255, alpha: 1)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    

    
    

    
    
    func setupCollectionView(){
        collectionView.register(PopularCollectionViewCell.self, forCellWithReuseIdentifier: popularCellId)
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: customCellId)
        collectionView.register(CustomHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerCellId)
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerCellId, for: indexPath)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        print("")
        return CGSize(width: view.frame.width, height: 450)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
  
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.row {
        case 0:  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellId, for: indexPath)
                return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: popularCellId, for: indexPath)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCellId", for: indexPath)
            return cell
        }
       
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case 0:  return CGSize(width: view.frame.width  - 2 * padding, height: 350)
        case 1 :  return CGSize(width: view.frame.width  - 2 * padding, height: 650)
        default: return CGSize(width: view.frame.width  - 2 * padding, height: 350)
        }
      
    }
    
    
    
    func setupLayout(){
       // Layout Customization
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            let padding: CGFloat = 16
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
            layout.sectionHeadersPinToVisibleBounds = true
        }
    }
    
  
    

    

    

}
