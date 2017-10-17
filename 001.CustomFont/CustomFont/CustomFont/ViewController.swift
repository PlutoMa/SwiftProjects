//
//  ViewController.swift
//  CustomFont
//
//  Created by Dareway on 2017/10/17.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let label = UILabel()
    let button = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //label
        label.text = "I'm Iron Man"
        label.textAlignment = .center
        view.addSubview(label)
        label.snp.makeConstraints { (maker) in
            maker.top.equalTo(100.0)
            maker.centerX.equalTo(self.view.snp.centerX)
        }
        label.font = UIFont.systemFont(ofSize: 30)
        
        //button
        button.setTitle("Change Font Family", for: .normal)
        button.addTarget(self, action: #selector(changeFontFamily), for: .touchUpInside)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.layer.cornerRadius = 5.0
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 1.0
        view.addSubview(button)
        button.snp.makeConstraints { (maker) in
            maker.top.equalTo(500.0)
            maker.centerX.equalTo(self.view.snp.centerX)
            maker.width.equalTo(200.0)
        }
        
        //printFontNames
        printAllSupportedFontNames()
    }
    
    ///changeFontFamily
    @objc
    func changeFontFamily() -> Void {
        label.font = UIFont(name: "Savoye LET", size: 30.0)
    }
    
    ///printAllSupportedFontNames
    func printAllSupportedFontNames() -> Void {
        let familyNames = UIFont.familyNames
        for familyName in familyNames {
            print("+++++ \(familyName)")
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            for fontName in fontNames {
                print("----- \(fontName)")
            }
        }
    }
}

