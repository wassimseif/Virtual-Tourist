//
//  Pin.swift
//  VirtualTourist
//
//  Created by Wassim Seifeddine on 4/19/16.
//  Copyright © 2016 Wassim Seifeddine. All rights reserved.
//

import Foundation
import CoreData
import MapKit

// Class responsible to represent a PIN in the core data model
class Pin: NSManagedObject, MKAnnotation {
    
    @NSManaged var latitude: NSNumber
    @NSManaged var longitude: NSNumber
    @NSManaged var photos: [Photo]
    
    // responsible to hold the ammount of pages that this pin
    // contains when search for photos.
    // It used to get a new set of photos every time the user request 
    // a new collection
    @NSManaged var pagesOfPhotos: NSNumber
    
    private var _coords: CLLocationCoordinate2D?
    var coordinate: CLLocationCoordinate2D {
        
        set {
            willChangeValueForKey("coordinate")
            _coords = newValue
            
            // set the new values of the lat and long
            if let coord = _coords {
                latitude = coord.latitude
                longitude = coord.longitude
            }
            
            didChangeValueForKey("coordinate")
        }
        
        get {
            if _coords == nil {
                _coords = CLLocationCoordinate2DMake(latitude as CLLocationDegrees, longitude as CLLocationDegrees)
            }
            
            return _coords!
        }
    }
    
    var title: String? = nil
    var subtitle: String? = nil
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init(latitude: NSNumber, longitude: NSNumber, context: NSManagedObjectContext) {
        
        let entity = NSEntityDescription.entityForName("Pin", inManagedObjectContext: context)
        super.init(entity: entity!, insertIntoManagedObjectContext: context)
        
        self.latitude = latitude
        self.longitude = longitude
        
        coordinate = CLLocationCoordinate2DMake(latitude as CLLocationDegrees, longitude as CLLocationDegrees)
        
        pagesOfPhotos = 0
    }
}
