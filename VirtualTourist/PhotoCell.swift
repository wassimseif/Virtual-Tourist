//
//  PhotoCell.swift
//  VirtualTourist
//
//  Created by Wassim Seifeddine on 4/20/16.
//  Copyright © 2016 Wassim Seifeddine. All rights reserved.
//

import Foundation
import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var photo: UIImageView!
    
    // Using this like the ios-persistence-2.0 step5.5 to cancel
    // previous tasks when a new is set
    //
    var taskToCancelifCellIsReused: NSURLSessionTask? {
        
        didSet {
            if let taskToCancel = oldValue {
                taskToCancel.cancel()
            }
        }
    }
}