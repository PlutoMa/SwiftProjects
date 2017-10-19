//
//  ViewController.swift
//  EmojiSlotMachine
//
//  Created by Dareway on 2017/10/19.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let slotMachine = UIPickerView()
    let emojiArray = ["😀","😎","😈","👻","🙈","🐶","🌚","🍎","🎾","🐥","🐔"]
    let resultLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() -> Void {
        slotMachine.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 220)
        slotMachine.center = CGPoint(x: view.bounds.width / 2.0, y: view.bounds.height / 2.0 - 50)
        slotMachine.delegate = self
        slotMachine.dataSource = self
        view.addSubview(slotMachine)
        
        randomRow(animation: false, equal: false)
        
        let actionBtn = UIButton(type: .system)
        actionBtn.frame = CGRect(x: 0, y: 0, width: 275, height: 40)
        actionBtn.center = CGPoint(x: slotMachine.center.x, y: view.bounds.height / 2.0 + 140)
        actionBtn.backgroundColor = UIColor.green
        actionBtn.setTitle("Go", for: .normal)
        actionBtn.setTitleColor(UIColor.white, for: .normal)
        actionBtn.addTarget(self, action: #selector(actionBtnAction), for: .touchUpInside)
        view.addSubview(actionBtn)
    
        let doubleTapGR = UITapGestureRecognizer(target: self, action: #selector(doubleTapGRAction))
        doubleTapGR.numberOfTapsRequired = 2
        actionBtn.addGestureRecognizer(doubleTapGR)
        
        resultLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        resultLabel.textAlignment = .center
        resultLabel.font = UIFont.systemFont(ofSize: 20)
        resultLabel.text = ""
        resultLabel.textColor = UIColor.black
        self.view.addSubview(resultLabel)
        resultLabel.center.x = self.view.center.x
        resultLabel.center.y = actionBtn.center.y + 100
    }
    
    @objc
    func actionBtnAction() -> Void {
        randomRow(animation: true, equal: false)
    }
    
    @objc
    func doubleTapGRAction() -> Void {
        randomRow(animation: true, equal: true)
    }
    
    func randomRow(animation: Bool, equal: Bool) -> Void {
        let row1 = Int(arc4random()) % (emojiArray.count - 2) + 1
        var row2 = 0
        var row3 = 0
        if equal == true {
            row2 = row1
            row3 = row1
        } else {
            row2 = Int(arc4random()) % (emojiArray.count - 2) + 1
            row3 = Int(arc4random()) % (emojiArray.count - 2) + 1
        }
        slotMachine.selectRow(row1, inComponent: 0, animated: animation)
        slotMachine.selectRow(row2, inComponent: 1, animated: animation)
        slotMachine.selectRow(row3, inComponent: 2, animated: animation)
        
        judge()
    }
    
    func judge() -> Void {
        if slotMachine.selectedRow(inComponent: 0) == slotMachine.selectedRow(inComponent: 1) && slotMachine.selectedRow(inComponent: 1) == slotMachine.selectedRow(inComponent: 2) {
            resultLabel.text = "👏👏👏"
        }
        else {
            resultLabel.text = "💔💔💔"
        }
    }

}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return emojiArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 90
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.text = emojiArray[row]
        pickerLabel.textAlignment = .center
        pickerLabel.font  = UIFont.systemFont(ofSize: 60)
        return pickerLabel
    }
}

