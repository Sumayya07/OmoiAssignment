//
//  SavedText+CoreDataProperties.swift
//  OmoiAssignment
//
//  Created by Sumayya Siddiqui on 16/11/23.
//
//

import Foundation
import CoreData


extension SavedText {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedText> {
        return NSFetchRequest<SavedText>(entityName: "SavedText")
    }

    @NSManaged public var content: String?
    @NSManaged public var dateAdded: Date?

}

extension SavedText : Identifiable {

}
