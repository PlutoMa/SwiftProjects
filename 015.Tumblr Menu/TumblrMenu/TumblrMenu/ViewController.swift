//
//  ViewController.swift
//  TumblrMenu
//
//  Created by Dareway on 2017/10/25.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let chatBtn = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        chatBtn.backgroundColor = UIColor.red
        chatBtn.setImageAndTitle(imageName: "Chat", title: "Chat", positionType: .PositionTop, space: 10)
        view.addSubview(chatBtn)
    }
    
}

