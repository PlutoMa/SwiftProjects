//
//  ViewController.swift
//  LimitInputTextField
//
//  Created by Dareway on 2017/10/17.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let limitedTextView = UITextView()
    let allowInputNumberLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let backView = UIView(frame: view.bounds)
        let backViewGR = UITapGestureRecognizer(target: self, action: #selector(backViewAction))
        backView.addGestureRecognizer(backViewGR)
        view.addSubview(backView)
        initNavigationBar()
        initInputField()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(noti:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(noti:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    ///keyboardWillShow(noti:)
    @objc
    func keyboardWillShow(noti: Notification) -> Void {
        let duration = noti.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        let endFrame = (noti.userInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        UIView.animate(withDuration: duration) {
            self.allowInputNumberLabel.frame = CGRect(x: self.allowInputNumberLabel.frame.origin.x, y: self.view.frame.height - self.allowInputNumberLabel.frame.height - endFrame.height, width: self.allowInputNumberLabel.frame.width, height: self.allowInputNumberLabel.frame.height)
        }
    }
    
    ///keyboardWillHide(noti:)
    @objc
    func keyboardWillHide(noti: Notification) -> Void {
        let duration = noti.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: duration) {
            self.allowInputNumberLabel.frame = CGRect(x: self.allowInputNumberLabel.frame.origin.x, y: self.view.frame.height - self.allowInputNumberLabel.frame.height, width: self.allowInputNumberLabel.frame.width, height: self.allowInputNumberLabel.frame.height)
        }
    }
    
    ///backViewAction
    @objc
    func backViewAction() -> Void {
        limitedTextView.resignFirstResponder()
    }
    
    ///initNavigationBar
    func initNavigationBar() -> Void {
        let leftItem = UIBarButtonItem(title: "Close", style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = leftItem
        let rightItem = UIBarButtonItem(title: "Twitter", style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = rightItem
    }
    
    ///initInputField
    func initInputField() -> Void {
        let naviFrame = self.navigationController?.navigationBar.frame
        let statusBarFrame = UIApplication.shared.statusBarFrame
        let avatarImageView = UIImageView(frame: CGRect(x: 10, y: naviFrame!.height + statusBarFrame.height + 10, width: 70, height: 70))
        avatarImageView.image = UIImage(named: "avatar.jpg")
        view.addSubview(avatarImageView)
        
        limitedTextView.frame = CGRect(x: 10 + 70 + 10, y: avatarImageView.frame.origin.y, width: view.frame.size.width - 90, height: 300)
        limitedTextView.font = UIFont.systemFont(ofSize: 20)
        limitedTextView.delegate = self
        view.addSubview(limitedTextView)
        
        allowInputNumberLabel.frame = CGRect(x: view.frame.width - 100, y: view.frame.height - 40, width: 100, height: 40)
        allowInputNumberLabel.text = "140"
        allowInputNumberLabel.textAlignment = .right
        view.addSubview(allowInputNumberLabel)
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let currentCount = textView.text.count
        if currentCount >= 140 {
            limitedTextView.resignFirstResponder()
        }
        allowInputNumberLabel.text = "\(140 - currentCount)"
    }
}

