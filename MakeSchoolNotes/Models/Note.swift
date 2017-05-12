//
//  Note.swift
//  MakeSchoolNotes
//
//  Created by Mia Hollins on 5/11/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Note: NSManagedObject {
    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var modificationTime: Date?
    convenience init(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelegate.persistentContainer
        let managedContext = persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: managedContext)
        self.init(entity: entity!, insertInto: managedContext)
    }
}
