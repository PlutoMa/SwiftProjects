//
//  ViewController.swift
//  BeautyContest
//
//  Created by Dareway on 2017/11/8.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit
import Koloda
import SnapKit

class ViewController: UIViewController {

    let kolodaView = KolodaView()
    lazy var dataSource: [UIImage] = {
        var dataSource = [UIImage]()
        for index in 1...10 {
            dataSource.append(UIImage(named: "Photo\(index)")!)
        }
        return dataSource
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
        
        kolodaView.delegate = self
        kolodaView.dataSource = self
        view.addSubview(kolodaView)
        kolodaView.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.view.snp.top).offset(100)
            maker.leading.equalTo(self.view.snp.leading).offset(20)
            maker.bottom.equalTo(self.view.snp.bottom).offset(-100)
            maker.trailing.equalTo(self.view.snp.trailing).offset(-20)
        }
        
        let dislikeButton = UIButton(type: .custom)
        dislikeButton.setImage(UIImage(named: "ic_skip"), for: .normal)
        dislikeButton.addTarget(self, action: #selector(dislikeAction), for: .touchUpInside)
        view.addSubview(dislikeButton)
        dislikeButton.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(self.view.snp.bottom).offset(-20)
            maker.leading.equalTo(self.view.snp.leading).offset(90)
            maker.width.equalTo(30)
            maker.height.equalTo(30)
        }
        
        let likeButton = UIButton(type: .custom)
        likeButton.setImage(UIImage(named: "ic_like"), for: .normal)
        likeButton.addTarget(self, action: #selector(likeAction), for: .touchUpInside)
        view.addSubview(likeButton)
        likeButton.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(self.view.snp.bottom).offset(-20)
            maker.trailing.equalTo(self.view.snp.trailing).offset(-90)
            maker.width.equalTo(30)
            maker.height.equalTo(30)
        }
    }
    
    @objc func dislikeAction() -> Void {
        kolodaView.swipe(.left)
    }
    
    @objc func likeAction() -> Void {
        kolodaView.swipe(.right)
    }

}

extension ViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        
    }
}

extension ViewController: KolodaViewDataSource {
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .`default`
    }
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return dataSource.count
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        return UIImageView(image: dataSource[index])
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        let overlayView = BeautyContestOverlayView(frame: self.kolodaView.frame)
        return overlayView
    }
    
    
}

