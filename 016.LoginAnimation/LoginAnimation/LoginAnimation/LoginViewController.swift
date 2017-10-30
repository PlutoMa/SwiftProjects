//
//  LoginViewController.swift
//  LoginAnimation
//
//  Created by Dareway on 2017/10/30.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 25.0 / 255.0, green: 153.0 / 255.0, blue: 3.0 / 255.0, alpha: 1.0)
        view.alpha = 0.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let userNameTextField = UITextField(frame: CGRect(x: -270, y: 50, width: 270, height: 40))
        userNameTextField.borderStyle = .roundedRect
        userNameTextField.placeholder = "UserName"
        view.addSubview(userNameTextField)
        
        let pswTextField = UITextField(frame: CGRect(x: -270, y: 100, width: 270, height: 40))
        pswTextField.borderStyle = .roundedRect
        pswTextField.placeholder = "Password"
        view.addSubview(pswTextField)
        
        let loginBtn = UIButton(type: .system)
        loginBtn.frame = CGRect(x: -125, y: 160, width: 125, height: 40)
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        loginBtn.backgroundColor = UIColor(red: 22.0 / 255.0, green: 139.0 / 255.0, blue: 3.0 / 255.0, alpha: 1.0)
        view.addSubview(loginBtn)
        
        UIView.animate(withDuration: 0.5) {
            self.view.alpha = 1
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.6, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: .allowAnimatedContent, animations: {
            userNameTextField.center.x = self.view.center.x
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.8, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: .allowAnimatedContent, animations: {
            pswTextField.center.x = self.view.center.x
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 1, options: .curveEaseIn, animations: {
            loginBtn.center.x = self.view.center.x
        }) { (isComplete) in
            UIView.animate(withDuration: 1, delay: 0.5, usingSpringWithDamping: 0.1, initialSpringVelocity: 2, options: .allowAnimatedContent, animations: {
                loginBtn.frame.size.width = 180
                loginBtn.center.x = self.view.center.x
            }, completion: nil)
        }
        
    }

}
