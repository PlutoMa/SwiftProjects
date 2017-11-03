//
//  ViewController.swift
//  BasicAnimations
//
//  Created by Dareway on 2017/11/3.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView(frame: CGRect.zero, style: .plain)
    private let dataSource = ["Position","Opacity","Scale","Color","Rotation"]
    private let cellHeight: CGFloat = 66
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animations"
        view.backgroundColor = UIColor.white
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "reuseCell")
        view.addSubview(tableView)
    }

}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(PositionAnimationViewController(), animated: true)
        case 1:
            self.navigationController?.pushViewController(OpacityAnimationViewController(), animated: true)
        case 2:
            self.navigationController?.pushViewController(ScaleAnimationViewController(), animated: true)
        case 3:
            self.navigationController?.pushViewController(ColorAnimationViewController(), animated: true)
        case 4:
            self.navigationController?.pushViewController(RotationAnimationViewController(), animated: true)
        default:
            return
        }
    }
}

