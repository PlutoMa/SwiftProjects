//
//  ViewController.swift
//  CoreDataApp
//
//  Created by Dareway on 2017/11/3.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let tableView = UITableView(frame: CGRect.zero, style: .plain)
    let entityName = "TodoList"
    var dataSource = [TodoList]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Todo List"
        
        let rightBarItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(rightBarItemAction))
        navigationItem.rightBarButtonItem = rightBarItem
        
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "reuseCell")
        view.addSubview(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateDataSource()
        tableView.reloadData()
    }
    
    @objc
    func rightBarItemAction() -> Void {
        let alert = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (_) in
            if let field = alert.textFields?[0] {
                self.saveContent(content: field.text!)
                self.updateDataSource()
                self.tableView.reloadData()
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addTextField { (textField) in
            textField.placeholder = "Please input the todo Item"
        }
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateDataSource() -> Void {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do {
            let searchResults = try getContext().fetch(fetchRequest)
            dataSource = searchResults as! [TodoList]
        } catch {
            print(error)
        }
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath)
        let content = dataSource[indexPath.row].content
        cell.textLabel?.text = content
        return cell
    }
}

// MARK: - CoreData
extension ViewController {
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func saveContent(content: String) -> Void {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)
        let todoList = NSManagedObject(entity: entity!, insertInto: context)
        todoList.setValue(content, forKey: "content")
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}

