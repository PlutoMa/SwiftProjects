//
//  RightViewController.swift
//  SnapChatLikeApp
//
//  Created by Dareway on 2017/11/8.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class RightViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let imageView = UIImageView(frame: view.bounds)
        imageView.image = #imageLiteral(resourceName: "IMG_2767.PNG")
        view.addSubview(imageView)
    }

}
