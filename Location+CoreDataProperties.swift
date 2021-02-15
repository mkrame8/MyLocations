//
//  Location+CoreDataProperties.swift
//  MyLocations
//
//  Created by Melanie Kramer on 2/12/21.
//  Copyright © 2021 Melanie Kramer. All rights reserved.
//
//

import Foundation
import CoreData
import CoreLocation


extension Location {

    // @nonobjc makes class, method or property unavailable to Objective-C
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var photoID: NSNumber?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var date: Date?
    @NSManaged public var locationDescription: String
    @NSManaged public var category: String
    @NSManaged public var placemark: CLPlacemark?

}

extension Location : Identifiable {

}
