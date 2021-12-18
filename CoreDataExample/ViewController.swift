//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Ahmed Qazzaz on 13/12/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
//
//            let newUser = User(context: context)
//            newUser.firstName = "ahmed"
//            newUser.lastName = "qazzaz"
//            newUser.username = "a123"
//
//                        try? context.save()
            //        }
            
            let users = DBManagement().listUsers()
//            print(users)
            var aUser = users.first(where: {$0.username == "a123"})
            
            var p = Product()
            aUser?.addToFavorits(p)
            
//            print(aUser?.firstName)
//            aUser?.firstName = "Ahmed"
//            aUser?.lastName = "Qazzaz"
//
//            context.delete(aUser!)
            try? context.save()
            
        }
        
    }


}

