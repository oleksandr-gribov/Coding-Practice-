//
//  Item.swift
//  MyList
//
//  Created by Oleksandr Gribov on 3/22/19.
//  Copyright © 2019 Oleksandr Gribov. All rights reserved.
//

import Foundation

class Item: NSObject, NSCoding {
    
    var name: String
    var completed: Bool
    
    init(_ name: String) {
        self.name = name
        self.completed = false
        
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey:"name")
        aCoder.encode(completed, forKey:"completed")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey:"name") as! String
        completed = aDecoder.decodeBool(forKey: "completed")
    }
    
    
}
