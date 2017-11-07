//
//  ViewController.swift
//  CarouselEffect
//
//  Created by Dareway on 2017/11/7.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var collectionView: UICollectionView!
    var dataSource: [CustomModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        createFekeData()
        
        let bgView = UIView(frame: view.bounds)
        let bgImageView = UIImageView(frame: view.bounds)
        bgImageView.image = #imageLiteral(resourceName: "bg.jpeg")
        bgView.addSubview(bgImageView)
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        bgView.addSubview(blurView)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "reuseCell")
        collectionView.backgroundView = bgView
        view.addSubview(collectionView)
        
        let segmentView = UISegmentedControl(items: ["FlowLayout", "CustomLayout"])
        segmentView.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.white], for: .normal)
        segmentView.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.black], for: .selected)
        segmentView.tintColor = UIColor.white
        segmentView.isMomentary = false
        segmentView.frame = CGRect(x: 10, y: 50, width: (self.view.frame.width) - 20, height: segmentView.bounds.height)
        segmentView.selectedSegmentIndex = 0
        segmentView.addTarget(self, action: #selector(action_segmentValueChanged(sender:)), for: UIControlEvents.valueChanged)
        self.view.addSubview(segmentView)
    }
    
    @objc func action_segmentValueChanged(sender: UISegmentedControl) {
        let layout = sender.selectedSegmentIndex == 0 ? UICollectionViewFlowLayout() : CustomCollectionViewLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
    }
    
    func createFekeData() -> Void {
        let model1 = CustomModel()
        model1.image = #imageLiteral(resourceName: "Photo1.jpg")
        
        let model2 = CustomModel()
        model2.image = #imageLiteral(resourceName: "Photo2.jpg")
        
        let model3 = CustomModel()
        model3.image = #imageLiteral(resourceName: "Photo3.jpg")
        
        let model4 = CustomModel()
        model4.image = #imageLiteral(resourceName: "Photo4.jpeg")
        
        let model5 = CustomModel()
        model5.image = #imageLiteral(resourceName: "Photo5.jpg")
        
        dataSource = [model1, model2, model3, model4, model5]
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 220, height: 360)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: (UIScreen.main.bounds.height - 360) / 2.0, left: 20, bottom: (UIScreen.main.bounds.height - 360) / 2.0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseCell", for: indexPath) as! CustomCollectionViewCell
        cell.configCell(model: dataSource[indexPath.item])
        return cell
    }
    
}

