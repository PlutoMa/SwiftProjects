//
//  InterfaceController.swift
//  WatchAppGuess WatchKit Extension
//
//  Created by Dareway on 2017/11/2.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController {

    @IBOutlet var guessLabel: WKInterfaceLabel!
    @IBOutlet var guessResultLabel: WKInterfaceLabel!
    
    var numberToBeGuessed: Int = 0
    var numberOfSlider: Int = 3
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        if WCSession.isSupported() {
            let wcsession = WCSession.default
            wcsession.delegate = self
            wcsession.activate()
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func updateSlider(_ value: Float) {
        numberOfSlider = Int(value * 5)
        guessLabel.setText("Your guess:\(numberOfSlider)")
    }
    
    @IBAction func guessBtnAction() {
        if numberToBeGuessed == 0 {
            guessResultLabel.setText("Plase generate a number")
        } else if numberToBeGuessed == numberOfSlider {
            guessResultLabel.setText("回答正确❤️")
        } else {
            guessResultLabel.setText("再猜一次💔")
        }
    }
}

extension InterfaceController: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        numberToBeGuessed = applicationContext["numberToBeGuessed"] as! Int
        guessResultLabel.setText("")
    }
    
}
