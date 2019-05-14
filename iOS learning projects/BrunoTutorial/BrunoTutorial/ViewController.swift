//
//  ViewController.swift
//  BrunoTutorial
//
//  Created by Oleksandr Gribov on 3/22/19.
//  Copyright © 2019 Oleksandr Gribov. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    private var todoItems = [ToDoItem]()
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "To-Do"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ViewController.didTapAddItemButton(_:)))
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    let itemArchiveURL: URL = {
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    
    func saveChanges() ->Bool {
        print ("Saving items to : \(itemArchiveURL.path)")
        return NSKeyedArchiver.archiveRootObject(todoItems, toFile: itemArchiveURL.path)
    }
    init() {
        if let archivedItems = NSKeyedUnarchiver.unarchiveObject(withFile: itemArchiveURL.path) as? [ToDoItem]{
            todoItems = archivedItems
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table View Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_todo", for: indexPath)
        
        if indexPath.row < todoItems.count {
            let item = todoItems[indexPath.row]
            cell.textLabel?.text = item.title
            
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row < todoItems.count {
            let item = todoItems[indexPath.row]
            item.done = !item.done
            
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.row < todoItems.count {
            todoItems.remove(at: indexPath.row )
            tableView.deleteRows(at: [indexPath], with: .top)
        }
    }
    
    // MARK: - Actions
    @objc func didTapAddItemButton (_ sender: UIBarButtonItem) {
        let alert = UIAlertController(
            title: "New to-do item",
            message: "Insert the title of the new to-do item:",
            preferredStyle: .alert)
        
        // add textfield to the alert
        alert.addTextField(configurationHandler: nil)
        
        // add cancel button
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // add ok button to the alert
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            if let title = alert.textFields?[0].text {
                self.addNewToDoItem(title: title)
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    private func addNewToDoItem(title:String){
        let newIndex = todoItems.count
        
        todoItems.append(ToDoItem(title: title))
        
        tableView.insertRows(at: [IndexPath(row: newIndex, section: 0)],with:.top)
        
    }


}

