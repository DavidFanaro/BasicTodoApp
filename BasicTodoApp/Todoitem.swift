//
//  TodoItem.swift
//  BasicTodoApp
//
//  Created by David Fanaro on 9/7/20.
//  Copyright © 2020 David Fanaro. All rights reserved.
//

import Foundation
import CoreData

public class Todoitem: NSManagedObject ,Identifiable{
    @NSManaged
    public var created_at: Date?
    
    @NSManaged
    public var title: String?
}

extension Todoitem{
    static func getAllTodoItem() -> NSFetchRequest<Todoitem>{
        let request = Todoitem.fetchRequest() as! NSFetchRequest<Todoitem>
        let sorter = NSSortDescriptor(key: "created_at", ascending: true)
        request.sortDescriptors = [sorter]
        return request
    }
}
