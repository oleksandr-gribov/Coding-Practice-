//
//  Photo.swift
//  Photorama
//
//  Created by Oleksandr Gribov on 3/27/19.
//  Copyright © 2019 Oleksandr Gribov. All rights reserved.
//

import Foundation

class Photo {
    
    let title: String
    let remoteURL: URL
    let photoID: String
    let dateTaken: Date
    
    init(title: String, photoID: String, remoteURL: URL, dateTaken: Date) {
        self.title = title
        self.photoID = photoID
        self.remoteURL = remoteURL
        self.dateTaken = dateTaken
        
    }
}
