//
//  ViewController.swift
//  SwipeableCell
//
//  Created by Dareway on 2017/10/18.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let cellHeight: CGFloat = 60.0
    private let colorRatio: CGFloat = 10.0
    private let tableView = UITableView(frame: CGRect.zero, style: .plain)
    private let lyric = "when i was young i'd listen to the radio,waiting for my favorite songs,when they played i'd sing along,it make me smile,those were such happy times and not so long ago,how i wondered where they'd gone,but they're back again just like a long lost friend,all the songs i love so well,every shalala every wo'wo,still shines,every shing-a-ling-a-ling"
    private var dataSource: Array<String>!
    private let actionController = UIAlertController(title: "", message: "", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = lyric.split(separator: ",").map(String.init)
        
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight = tableView.frame.height
        
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        if cell!.contentView.layer.sublayers != nil {
            for layer in cell!.contentView.layer.sublayers! {
                layer.removeFromSuperlayer()
            }
        }
        
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: cellHeight)
        let topColor = UIColor(red: CGFloat(indexPath.row * 2) * colorRatio / 255.0, green: 1.0, blue: CGFloat(indexPath.row * 2) * colorRatio / 255.0, alpha: 1.0)
        let bottomColor = UIColor(red: CGFloat(indexPath.row * 2 + 1) * colorRatio / 255.0, green: 1.0, blue: CGFloat(indexPath.row * 2 + 1) * colorRatio / 255.0, alpha: 1.0)
        layer.colors = [topColor.cgColor, bottomColor.cgColor]
        cell?.contentView.layer.addSublayer(layer)
        
        cell?.textLabel?.text = dataSource[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let likeAction = UITableViewRowAction(style: .normal, title: "👍") { (action, index) in
            self.actionController.message = "Like"
            self.showAlertController()
        }
        likeAction.backgroundColor = UIColor.white
        let dislikeAction = UITableViewRowAction(style: .normal, title: "👎") { (action, index) in
            self.actionController.message = "Dislike"
            self.showAlertController()
        }
        dislikeAction.backgroundColor = UIColor.white
        return [likeAction, dislikeAction]
    }
    
    func showAlertController() -> Void {
        self.present(actionController, animated: true) {
            let timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { (timer) in
                self.actionController.dismiss(animated: true, completion: nil)
            })
            RunLoop.main.add(timer, forMode: RunLoopMode.commonModes)
        }
    }
}

