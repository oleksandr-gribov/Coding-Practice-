//
//  ItemStore.swift
//  MyList
//
//  Created by Oleksandr Gribov on 3/22/19.
//  Copyright © 2019 Oleksandr Gribov. All rights reserved.
//

import Foundation

class ItemStore {
    var allItems = [Item]()
    
    func addNewItem (name:String) -> Item{
        let newItem = Item(name)
        allItems.append(newItem)
        return newItem
    }
    
    let itemArchiveUrl : URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    
    func saveChanges() -> Bool {
        print ("Saving items to: \(itemArchiveUrl.path)")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveUrl.path)
    }
    init() {
        if let archivedItems = NSKeyedUnarchiver.unarchiveObject(withFile: itemArchiveUrl.path) as? [Item] {
            allItems = archivedItems
        }
    }
}
