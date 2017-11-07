//
//  ViewController.swift
//  TwitterLikeSplash
//
//  Created by Dareway on 2017/11/7.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var maskView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let bgImageView = UIImageView(image: UIImage(named: "twitterBG.jpeg"))
        bgImageView.frame = view.bounds
        view.addSubview(bgImageView)
        
        let logoLayer = CALayer()
        logoLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        logoLayer.position = view.center
        logoLayer.contents = UIImage(named: "logo")?.cgImage
        view.layer.mask = logoLayer
        
        maskView = UIView(frame: view.bounds)
        maskView.backgroundColor = UIColor.white
        view.addSubview(maskView)
        
        let appDelegate = UIApplication.shared.delegate
        let window = appDelegate?.window!
        window?.backgroundColor = UIColor(red: 29 / 255.0, green: 161 / 255.0, blue: 242 / 255.0, alpha: 1)
        
        let logoAnimation = CAKeyframeAnimation(keyPath: "bounds")
        logoAnimation.beginTime = CACurrentMediaTime() + 1
        logoAnimation.duration = 1
        logoAnimation.keyTimes = [0, 0.4, 1]
        logoAnimation.values = [NSValue(cgRect: CGRect(x: 0, y: 0, width: 100, height: 100)),
                                NSValue(cgRect: CGRect(x: 0, y: 0, width: 85, height: 85)),
                                NSValue(cgRect: CGRect(x: 0, y: 0, width: 4500, height: 4500))]
        logoAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut),
                                         CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)]
        logoAnimation.fillMode = kCAFillModeForwards
        logoLayer.add(logoAnimation, forKey: "zoomAnimation")
        
        let logoOpacityAnimation = CABasicAnimation(keyPath: "opacity")
        logoOpacityAnimation.beginTime = CACurrentMediaTime() + 1
        logoOpacityAnimation.duration = 1
        logoOpacityAnimation.fromValue = 1
        logoOpacityAnimation.toValue = 0
        logoOpacityAnimation.delegate = self
        maskView.layer.add(logoOpacityAnimation, forKey: "opacityAnimation")
    }
    
}

extension ViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.maskView.removeFromSuperview()
        view.layer.mask = nil
    }
}

