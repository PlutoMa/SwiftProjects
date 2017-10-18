//
//  ViewController.swift
//  SimplePhotoBrowser
//
//  Created by Dareway on 2017/10/18.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let scrollView = UIScrollView()
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.frame = view.bounds
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "samplePhoto.jpeg")
        
        scrollView.frame = view.bounds
        scrollView.backgroundColor = UIColor.white
        scrollView.maximumZoomScale = 4.0
        scrollView.minimumZoomScale = 1.0
        scrollView.contentSize = imageView.frame.size
        scrollView.delegate = self
        scrollView.addSubview(imageView)
        
        view.addSubview(scrollView)
    }

}

extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

