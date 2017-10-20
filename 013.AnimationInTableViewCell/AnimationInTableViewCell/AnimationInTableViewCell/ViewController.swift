//
//  ViewController.swift
//  AnimationInTableViewCell
//
//  Created by Dareway on 2017/10/20.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cellHeight: CGFloat = 60.0
    let colorRatio: CGFloat = 10.0
    let tableView = UITableView(frame: CGRect.zero, style: .plain)
    let lyric = "when i was young i'd listen to the radio,waiting for my favorite songs,when they played i'd sing along,it make me smile,those were such happy times and not so long ago,how i wondered where they'd gone,but they're back again just like a long lost friend,all the songs i love so well,every shalala every wo'wo,still shines,every shing-a-ling-a-ling"
    var dataSource = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = cellHeight
        view.addSubview(tableView)
        dataSource = lyric.components(separatedBy: ",")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
        
        let tableHeight = tableView.frame.size.height
        let cells = tableView.visibleCells
        
        for (index, cell) in cells.enumerated() {
            cell.frame.origin.y = tableHeight
            UIView.animate(withDuration: 1.0, delay: 0.04 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.frame.origin.y = 0
            }, completion: nil)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = dataSource[indexPath.row]
        if cell!.contentView.layer.sublayers != nil {
            for layer in cell!.contentView.layer.sublayers! {
                layer.removeFromSuperlayer()
            }
        }
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: cellHeight)
        let topColor = UIColor(red: CGFloat(indexPath.row * 2) * colorRatio / 255.0, green: 1.0, blue: CGFloat(indexPath.row * 2) * colorRatio / 255.0, alpha: 1.0)
        let bottomColor = UIColor(red: CGFloat(indexPath.row * 2 + 1) * colorRatio / 255.0, green: 1.0, blue: CGFloat(indexPath.row * 2 + 1) * colorRatio / 255.0, alpha: 1.0)
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        cell!.contentView.layer.addSublayer(gradientLayer)
        return cell!
    }
}

