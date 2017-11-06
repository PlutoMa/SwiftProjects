//
//  ViewController.swift
//  VerticalMenuTransition
//
//  Created by Dareway on 2017/11/6.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate, CustomTransitionDelegate {

    let transition = CustomTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        let imageView = UIImageView(frame: view.bounds)
        imageView.image = UIImage(named: "Photo10")
        view.addSubview(imageView)
        
        let menuButtonBar = UIBarButtonItem(title: "🎾", style: .plain, target: self, action: #selector(triggerMenu))
        navigationItem.leftBarButtonItem = menuButtonBar
    }
    
    @objc func triggerMenu() -> Void {
        let menuViewController = MenuViewController()
        menuViewController.transitioningDelegate = self
        menuViewController.modalPresentationStyle = .custom
        self.navigationController?.present(menuViewController, animated: true, completion: nil)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.navigationType = .present
        transition.delegate = self
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.navigationType = .dismiss
        return transition
    }
    
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }

}

