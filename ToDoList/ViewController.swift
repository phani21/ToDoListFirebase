//
//  ViewController.swift
//  ToDoList
//
//  Created by IMCS2 on 2/14/19.
//  Copyright © 2019 com.phani. All rights reserved.
//
  //var i : Int=0
import UIKit
  var textArray  = [String]()
var completedArray = [String]()
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var table: UITableView!

    var text: String = ""
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = textArray[indexPath.row]
        UserDefaults.standard.set(textArray, forKey: "key")
        return cell
    }
    
  
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let completed = UIContextualAction(style: .normal, title: "Completed") { (action, view, nil) in
     
            completedArray.insert(textArray[indexPath.row], at: 0)
            UserDefaults.standard.set(completedArray,forKey:"keykey")
            print("Completed Array :  \(completedArray)")
            print(UserDefaults.standard.value(forKey: "keykey")!)
            textArray.remove(at: indexPath.row)
            UserDefaults.standard.set(textArray,forKey: "key")
         
            self.table.reloadData()
        }
        completed.backgroundColor = UIColor.green
        return UISwipeActionsConfiguration(actions: [completed])
    }
  
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, nil) in
           
        textArray.remove(at: indexPath.row)
            UserDefaults.standard.set(textArray,forKey: "key")
            self.table.reloadData()
            print(textArray)
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

            textArray=UserDefaults.standard.value(forKey: "key") as! [String]
        
        if text != ""{
            textArray.insert(text, at: 0)

        }
        
    }


}

