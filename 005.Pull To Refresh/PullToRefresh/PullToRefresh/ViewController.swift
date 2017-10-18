//
//  ViewController.swift
//  PullToRefresh
//
//  Created by Dareway on 2017/10/18.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView(frame: CGRect.zero, style: .plain)
    var dataSource = Array<Date>()
    let refresh = UIRefreshControl()
    lazy var dateFormatter = { () -> DateFormatter in
        let tempDF = DateFormatter()
        tempDF.dateFormat = "yyyy年MM月dd日/HH时mm分ss秒"
        return tempDF
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.bounds
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        addNewElementToArray()
        tableView.reloadData()
        
        refresh.attributedTitle = NSAttributedString(string: "下拉刷新")
        refresh.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
        tableView.addSubview(refresh)
    }
    
    func addNewElementToArray() -> Void {
        dataSource.insert(Date(), at: 0)
    }
    
    @objc
    func refreshAction() -> Void {
        addNewElementToArray()
        refresh.endRefreshing()
        tableView.reloadData()
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
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell1")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell1")
            cell?.selectionStyle = .none
        }
        cell!.textLabel?.text = getShowString(date: dataSource[indexPath.row])
        return cell!
    }
    
    func getShowString(date: Date) -> String {
        
        return dateFormatter.string(from:date)
    }
}

