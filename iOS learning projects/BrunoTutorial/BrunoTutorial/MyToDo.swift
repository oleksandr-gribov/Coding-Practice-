//
//  MyToDo.swift
//  BrunoTutorial
//
//  Created by Oleksandr Gribov on 3/22/19.
//  Copyright © 2019 Oleksandr Gribov. All rights reserved.
//

import Foundation

class ToDoItem: NSObject, NSCoding {
   
    
    var title: String
    var done: Bool
    
   
    
    public init (title: String ){
        self.title = title
        self.done = false
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.title, forKey: "title")
        aCoder.encode(self.done, forKey: "done")
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let title = aDecoder.decodeObject(forKey:"title") as? String {
            self.title = title
        } else {
            return nil
        }
        if aDecoder.containsValue(forKey: "done") {
            self.done = aDecoder.decodeBool(forKey: "done")
        } else {
            return nil
        }
    }
    
}

extension ToDoItem {
    public class func getMockData() -> [ToDoItem]
    {
        return [
        ToDoItem(title: "Milk"),
        ToDoItem(title: "Chocolate"),
        ToDoItem(title: "Light Bulb"),
        ToDoItem(title: "Dog food")]
        }
    }
