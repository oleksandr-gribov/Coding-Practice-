//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Oleksandr Gribov on 3/27/19.
//  Copyright © 2019 Oleksandr Gribov. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchInterestingPhotos()
    }
}
