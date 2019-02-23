//
//  ViewController.swift
//  ToDoList
//
//  Created by IMCS2 on 2/14/19.
//  Copyright © 2019 com.phani. All rights reserved.
//
//var i : Int=0
import Firebase
import UIKit
var textArray  = [String]()
var completedArray = [String]()
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    var text: String = ""
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("TextARRAY COUNT   \(textArray.count)")
        return textArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        let  reff = Database.database().reference().child("list/list")
        reff.observe(.value) { (snapshot) in
            textArray = snapshot.value as? [String] ?? []
            
        }
        
        cell.textLabel?.text = textArray[indexPath.row]
        
        let ref4 = Database.database().reference().child("list/list")
        ref4.setValue(textArray)
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let completed = UIContextualAction(style: .normal, title: "Completed") { (action, view, nil) in
            
            completedArray.insert(textArray[indexPath.row], at: 0)
            
            
            let ref = Database.database().reference().child("complist")
            ref.child("complist").setValue(completedArray)
            
            print("Completed Array :  \(completedArray)")
            
            
            textArray.remove(at: indexPath.row)
            
            
            let ref1 = Database.database().reference().child("list")
            ref1.child("list").setValue(textArray)
            
            
            self.table.reloadData()
        }
        completed.backgroundColor = UIColor.green
        return UISwipeActionsConfiguration(actions: [completed])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, nil) in
            
            textArray.remove(at: indexPath.row)
            
            let ref1 = Database.database().reference().child("list/list")
            ref1.setValue(textArray)
            self.table.reloadData()
            print(textArray)
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Inside Viewcontroller.ViewDidLoad()")
        if(self.text != ""){
            textArray.insert(self.text, at: 0)
            let ref2 = Database.database().reference().child("list/list")
            ref2.setValue(textArray)
            self.table.reloadData()
        }
        let  ref = Database.database().reference().child("list/list")
        ref.observe(.value) { (snapshot) in
            textArray = snapshot.value  as? [String] ?? []
            print("textARRAYY")
            print(textArray)
            self.table.reloadData()
        }
        
        
        
        
        
        
        
    }
    
}
