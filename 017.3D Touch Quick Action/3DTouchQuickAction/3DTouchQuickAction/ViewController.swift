//
//  ViewController.swift
//  3DTouchQuickAction
//
//  Created by Dareway on 2017/10/30.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    var actionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionLabel = UILabel(frame: CGRect(x: 50, y: 50, width: 400, height: 50))
        actionLabel.text = "Please Press the 3D action"
        view.addSubview(actionLabel)
        
        NotificationCenter.default.addObserver(self, selector: #selector(shortCutActionClicked(sender:)), name: NSNotification.Name.init("ShortcutAction"), object: nil)
        
        let fingerPrintImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 128, height: 128))
        fingerPrintImageView.image = UIImage(named: "fingerprint.png")
        view.addSubview(fingerPrintImageView)
        fingerPrintImageView.center = view.center
        
        self.registerForPreviewing(with: self, sourceView: self.view)
    }
    
    @objc
    func shortCutActionClicked(sender: Notification) -> Void {
        let shortcutItem = sender.userInfo?["shortcutItem"] as! UIApplicationShortcutItem
        if shortcutItem.type == "LoveItem" {
            changeLabel(with: "Yes, I do ❤️ you!")
        }
    }
    
    func changeLabel(with name: String) -> Void {
        actionLabel.text = name
    }
}

extension ViewController: UIViewControllerPreviewingDelegate {
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        previewingContext.sourceRect = CGRect(x: 10, y: 10, width: view.frame.width - 20, height: view.frame.height - 10)
        return SFSafariViewController(url: URL(string: "http://www.qq.com")!)
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        self.show(viewControllerToCommit, sender: self)
    }
    
    
}

extension SFSafariViewController {
    open override var previewActionItems: [UIPreviewActionItem] {
        let deleteAction = UIPreviewAction(title: "删除", style: .destructive) { (previewAction, vc) in
            print("Delete")
        }
        let doneAction = UIPreviewAction(title: "完成", style: .default) { (previewAction, vc) in
            print("Done")
        }
        return [deleteAction,doneAction]
    }
}

