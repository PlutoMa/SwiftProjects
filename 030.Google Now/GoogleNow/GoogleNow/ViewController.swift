//
//  ViewController.swift
//  GoogleNow
//
//  Created by Dareway on 2017/11/9.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let transition = BubbleTransition()
    let triggerButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 242.0 / 255.0, green: 242.0 / 255.0, blue: 242.0 / 255.0, alpha: 10)
        
        let leftImageView = UIImageView(frame: CGRect(x: 22, y: 22, width: 25, height: 25))
        leftImageView.image = UIImage(named: "setting")
        view.addSubview(leftImageView)
        
        let rightImageView = UIImageView(frame: CGRect(x: view.frame.size.width - 22 - 25, y: 22, width: 25, height: 25))
        rightImageView.image = UIImage(named: "window")
        view.addSubview(rightImageView)
        
        let signInLabel = UILabel()
        signInLabel.text = "SIGN IN"
        signInLabel.frame.origin.y = 22
        signInLabel.textColor = UIColor(red: 150.0 / 255.0, green: 150.0 / 255.0, blue: 150.0 / 255.0, alpha: 1.0)
        signInLabel.font = UIFont.systemFont(ofSize: 20)
        signInLabel.sizeToFit()
        signInLabel.center.x = view.center.x
        view.addSubview(signInLabel)
        
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "google_logo")
        logoImageView.frame.size = CGSize(width: 170, height: 71)
        logoImageView.center.x = view.center.x
        logoImageView.center.y = view.center.y - 50 - 71
        view.addSubview(logoImageView)
        
        let inputView = UITextField()
        inputView.frame.size = CGSize(width: view.frame.size.width - 60, height: 50)
        inputView.center.x = view.center.x
        inputView.center.y = view.center.y - 20
        inputView.borderStyle = .none
        inputView.layer.borderColor = UIColor(red: 238.0 / 255.0, green: 238.0 / 255.0, blue: 238.0 / 255.0, alpha: 1.0).cgColor
        inputView.backgroundColor = UIColor.white
        inputView.layer.borderWidth = 1
        view.addSubview(inputView)
        
        triggerButton.frame.size = CGSize(width: 70, height: 70)
        triggerButton.center.x = view.center.x
        triggerButton.frame.origin.y = inputView.frame.maxY + 40
        triggerButton.backgroundColor = UIColor.white
        triggerButton.addTarget(self, action: #selector(triggerAction), for: .touchUpInside)
        triggerButton.layer.cornerRadius = triggerButton.frame.width / 2.0
        triggerButton.layer.masksToBounds = true
        triggerButton.layer.shadowColor = UIColor.black.cgColor
        triggerButton.setImage(UIImage(named: "speaking"), for: .normal)
        view.addSubview(triggerButton)
    }
    
    @objc func triggerAction() -> Void {
        let anotherVC = AnotherViewController()
        anotherVC.transitioningDelegate = self
        anotherVC.modalPresentationStyle = .custom
        self.present(anotherVC, animated: true, completion: nil)
    }

}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = triggerButton.center
        transition.bubbleColor = triggerButton.backgroundColor!
        transition.animationBlock = {(transitionMode) -> Void in
            if transitionMode == .dismiss {
                let dismissedVC = dismissed as! AnotherViewController
                dismissedVC.dismissButton.frame.origin.y = self.view.frame.height - 250
            }
        }
        transition.duration = 0.4
        return transition
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = triggerButton.center
        transition.bubbleColor = UIColor.white
        transition.animationBlock = {(transitionMode) -> Void in
            if transitionMode == .present {
                let targetVC = presented as! AnotherViewController
                targetVC.dismissButton.frame.origin.y = self.view.frame.height - 150
            }
        }
        transition.duration = 0.4
        return transition
    }
}

