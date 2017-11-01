//
//  DetailViewController.swift
//  SpotlightSearch
//
//  Created by Dareway on 2017/11/1.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    init(data: [String : Any]) {
        super.init(nibName: nil, bundle: nil)
        let cover = data["cover"] as? UIImage
        let description = data["description"] as? String
        let name = data["name"] as? String
        
        let coverImageView = UIImageView(frame: CGRect(x: 10, y: 80, width: 100, height: 140))
        self.view.addSubview(coverImageView)
        coverImageView.center.x = self.view.center.x
        coverImageView.image = cover
        
        let nameLabel = UILabel(frame: CGRect(x: 10, y: coverImageView.frame.height + 60 + 10, width: 300, height: 50))
        nameLabel.text = name
        nameLabel.textAlignment = .center
        nameLabel.center.x = self.view.center.x
        self.view.addSubview(nameLabel)
        
        let textViewY = coverImageView.frame.height + 50 + 50 + 10
        let textView = UITextView(frame: CGRect(x: 0, y: textViewY, width: self.view.frame.width, height: self.view.frame.height - textViewY - 10))
        self.view.addSubview(textView)
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.text = description
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }

}
