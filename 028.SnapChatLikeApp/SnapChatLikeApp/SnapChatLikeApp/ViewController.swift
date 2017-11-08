//
//  ViewController.swift
//  SnapChatLikeApp
//
//  Created by Dareway on 2017/11/8.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = UIColor.white
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: view.frame.width, height: 0)
        view.addSubview(scrollView)
        
        let leftVC = LeftViewController()
        let centerVC = CenterViewController()
        let rightVC = RightViewController()
        
        addChildViewController(leftVC)
        scrollView.addSubview(leftVC.view)
        leftVC.view.frame.origin.x = 0
        
        addChildViewController(centerVC)
        scrollView.addSubview(centerVC.view)
        centerVC.view.frame.origin.x = view.frame.size.width
        
        addChildViewController(rightVC)
        scrollView.addSubview(rightVC.view)
        rightVC.view.frame.origin.x = 2 * view.frame.size.width
        
        scrollView.contentSize = CGSize(width: 3 * view.frame.size.width, height: view.frame.size.height)
    }
}

