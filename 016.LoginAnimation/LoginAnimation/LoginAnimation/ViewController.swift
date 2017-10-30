//
//  ViewController.swift
//  LoginAnimation
//
//  Created by Dareway on 2017/10/30.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let buttonHeight: CGFloat = 56.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor(red: 25.0 / 255.0, green: 153.0 / 255.0, blue: 3.0 / 255.0, alpha: 1.0)
    
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 50, width: 334, height: 101))
        logoImageView.image = UIImage(named: "logo.png")
        logoImageView.center.x = view.center.x
        view.addSubview(logoImageView)
        
        let loginBtn = UIButton(type: .system)
        loginBtn.frame = CGRect(x: 0, y: view.frame.height - buttonHeight, width: view.frame.width / 2.0, height: buttonHeight)
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        loginBtn.setTitle("LOG IN", for: .normal)
        loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        loginBtn.backgroundColor = UIColor(red: 35.0 / 255.0, green: 36.0 / 255.0, blue: 38.0 / 255.0, alpha: 1.0)
        view.addSubview(loginBtn)
        loginBtn.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        
        let signupBtn = UIButton(type: .system)
        signupBtn.frame = CGRect(x: view.frame.width / 2.0, y: view.frame.height - buttonHeight, width: view.frame.width / 2.0, height: buttonHeight)
        signupBtn.setTitleColor(UIColor.white, for: .normal)
        signupBtn.setTitle("SIGN UP", for: .normal)
        signupBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        signupBtn.backgroundColor = UIColor(red: 42.0 / 255.0, green: 183.0 / 255.0, blue: 90.0 / 255.0, alpha: 1.0)
        view.addSubview(signupBtn)
    }
    
    @objc
    func loginAction() -> Void {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: false)
    }
}

