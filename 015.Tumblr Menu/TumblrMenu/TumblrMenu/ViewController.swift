//
//  ViewController.swift
//  TumblrMenu
//
//  Created by Dareway on 2017/10/25.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var blurView: UIVisualEffectView!
    var alphaBtn: CustomButton!
    var quoteBtn: CustomButton!
    var chatBtn: CustomButton!
    var photoBtn: CustomButton!
    var linkBtn: CustomButton!
    var audioBtn: CustomButton!
    let dumpingRate:CGFloat = 0.7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgImageView = UIImageView(frame: view.bounds)
        bgImageView.image = UIImage(named: "LaunchImage1")
        view.addSubview(bgImageView)
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        view.addGestureRecognizer(tapGR)
    }
    
    @objc
    func tapAction() -> Void {
        setupFunctions()
        
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(removeBlur))
        blurView.addGestureRecognizer(tapGes)
        blurView.alpha = 0
        
        UIView.animate(withDuration: 0.3) {
            self.blurView.alpha = 1
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: dumpingRate, initialSpringVelocity: 10, options: .allowAnimatedContent, animations: {
            self.alphaBtn.frame.origin.x = 60
            self.photoBtn.frame.origin.x = 192
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: dumpingRate, initialSpringVelocity: 10, options: .allowAnimatedContent, animations: {
            self.quoteBtn.frame.origin.x = 60
            self.linkBtn.frame.origin.x = 192
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: dumpingRate, initialSpringVelocity: 10, options: .allowAnimatedContent, animations: {
            self.chatBtn.frame.origin.x = 60
            self.audioBtn.frame.origin.x = 192
        }, completion: nil)
    }
    
    func setupFunctions() -> Void {
        let blurEffect: UIBlurEffect = UIBlurEffect(style: .dark)
        blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        self.view.addSubview(blurView)
        alphaBtn = CustomButton(frame: CGRect(x: -88, y: 80, width: 88, height: 88))
        alphaBtn.setImageAndTitle(imageName: "Text", title: "Message", positionType: .PositionTop, space: 10)
        blurView.contentView.addSubview(alphaBtn)
        
        quoteBtn = CustomButton(frame: CGRect(x: -88, y: 246, width: 88, height: 88))
        quoteBtn.setImageAndTitle(imageName: "Quote", title: "Quote", positionType: .PositionTop, space: 10)
        blurView.contentView.addSubview(quoteBtn)
        
        chatBtn = CustomButton(frame: CGRect(x: -88, y: 406, width: 88, height: 88))
        chatBtn.setImageAndTitle(imageName: "Chat", title: "Chat", positionType: .PositionTop, space: 10)
        
        photoBtn = CustomButton(frame: CGRect(x: self.view.frame.width + 88, y: 80, width: 88, height: 88))
        photoBtn.setImageAndTitle(imageName: "Photo", title: "Photo", positionType: .PositionTop, space: 10)
        blurView.contentView.addSubview(photoBtn)
        
        linkBtn = CustomButton(frame: CGRect(x: self.view.frame.width + 88, y: 246, width: 88, height: 88))
        linkBtn.setImageAndTitle(imageName: "Link", title: "Link", positionType: .PositionTop, space: 10)
        blurView.contentView.addSubview(linkBtn)
        
        audioBtn = CustomButton(frame: CGRect(x: self.view.frame.width + 88, y: 406, width: 88, height: 88))
        audioBtn.setImageAndTitle(imageName: "Audio", title: "Audio", positionType: .PositionTop, space: 10)
        blurView.contentView.addSubview(audioBtn)
        
        blurView.contentView.addSubview(chatBtn)
    }
    
    @objc
    func removeBlur() -> Void {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 3, initialSpringVelocity: 1, options: .allowAnimatedContent, animations: {
            self.blurView.alpha = 0
            self.alphaBtn.frame.origin.x = -88
            self.quoteBtn.frame.origin.x = -88
            self.chatBtn.frame.origin.x = -88
            
            self.linkBtn.frame.origin.x = self.view.frame.width + 88
            self.photoBtn.frame.origin.x = self.view.frame.width + 88
            self.audioBtn.frame.origin.x = self.view.frame.width + 88
        }) { (isFinished) in
            self.blurView.removeFromSuperview()
            self.alphaBtn.removeFromSuperview()
            self.quoteBtn.removeFromSuperview()
            self.linkBtn.removeFromSuperview()
            self.photoBtn.removeFromSuperview()
            self.audioBtn.removeFromSuperview()
            self.blurView.removeFromSuperview()
        }
    }
}

