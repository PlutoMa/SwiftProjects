//
//  ViewController.swift
//  WatchAppGuess
//
//  Created by Dareway on 2017/11/2.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {

    let wcsession = WCSession.default
    
    let label: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.yellow
        
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        label.center = CGPoint(x: view.center.x, y: view.center.y - 50)
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 22)
        label.textAlignment = .center
        view.addSubview(label)
        
        let generateNumberBtn = UIButton(type: .custom)
        generateNumberBtn.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        generateNumberBtn.center = view.center
        generateNumberBtn.setTitle("Generste Number", for: .normal)
        generateNumberBtn.setTitleColor(UIColor.black, for: .normal)
        generateNumberBtn.setTitleColor(UIColor.red, for: .highlighted)
        generateNumberBtn.setTitleColor(UIColor.green, for: .selected)
        generateNumberBtn.layer.borderColor = UIColor.black.cgColor
        generateNumberBtn.layer.borderWidth = 1
        generateNumberBtn.layer.cornerRadius = 8
        view.addSubview(generateNumberBtn)
        generateNumberBtn.addTarget(self, action: #selector(generateNumberBtnAction), for: .touchUpInside)
        
        if WCSession.isSupported() {
            wcsession.delegate = self
            wcsession.activate()
        }
        
    }
    
    @objc
    func generateNumberBtnAction() -> Void {
        let number: Int = Int(arc4random()) % 5 + 1
        label.text = "\(number)"
        do {
            try wcsession.updateApplicationContext(["numberToBeGuessed" : number])
        } catch _ {
            print("Error Happened!")
        }
    }


}

extension ViewController: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
}

