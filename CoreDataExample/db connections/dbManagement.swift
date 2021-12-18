//
//  dbManagement.swift
//  CoreDataExample
//
//  Created by Ahmed Qazzaz on 18/12/2021.
//

import UIKit
import CoreData

class DBManagement {
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func addNewUser(username: String, firstName: String, lastName: String)->User?{
        guard let context = context else {return nil}
        
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as? User
        user?.username = username
        user?.firstName = firstName
        user?.lastName = lastName
        
        try? context.save()
        
        return user
    }
    
    func listUsers()->[User]{
        
        let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
        let users =  (try? context?.fetch(fetchRequest)) ?? []
        return users

    }
    
    func geta123(searchFor key: String){
        var fetchRequest : NSFetchRequest<User> = User.fetchRequest()
        let sort = NSSortDescriptor(key: "firstName", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        fetchRequest.predicate = NSPredicate(format: "username = '%@'", key)
    }
    
}
