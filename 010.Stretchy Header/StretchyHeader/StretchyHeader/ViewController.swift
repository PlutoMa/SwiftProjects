//
//  ViewController.swift
//  StretchyHeader
//
//  Created by Dareway on 2017/10/19.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let image = UIImage(named: "IMG_4557.JPG")!
    var imageHeight: CGFloat!
    let tableView = UITableView(frame: CGRect.zero, style: .plain)
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageHeight = UIScreen.main.bounds.width / image.size.width * image.size.height
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: 0, y: -imageHeight, width: UIScreen.main.bounds.width, height: imageHeight)
        
        tableView.frame = UIScreen.main.bounds
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.contentInset = UIEdgeInsetsMake(imageHeight, 0, 0, 0)
        tableView.addSubview(imageView)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell?.selectionStyle = .none
        }
        cell?.textLabel?.text = "\(indexPath.section)---\(indexPath.row)"
        return cell!
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == tableView {
            if scrollView.contentOffset.y < -imageHeight {
                imageView.frame = CGRect(x: 0, y: scrollView.contentOffset.y, width: imageView.frame.size.width, height: -scrollView.contentOffset.y)
            } else {
                imageView.frame = CGRect(x: 0, y: -imageHeight, width: imageView.frame.width, height: imageHeight)
            }
        }
    }
}

