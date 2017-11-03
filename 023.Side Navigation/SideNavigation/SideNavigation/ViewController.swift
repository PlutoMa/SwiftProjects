//
//  ViewController.swift
//  SideNavigation
//
//  Created by Dareway on 2017/11/3.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let imageView = UIImageView(frame: view.bounds)
        imageView.image = UIImage(named: "ViewController")
        view.addSubview(imageView)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
}

