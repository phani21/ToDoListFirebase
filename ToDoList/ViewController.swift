//
//  ViewController.swift
//  ToDoList
//
//  Created by IMCS2 on 2/14/19.
//  Copyright © 2019 com.phani. All rights reserved.
//
  var i : Int=0
import UIKit
  var textArray  = [String]()
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBAction func CompletedButton(_ sender: Any) {
        
        performSegue(withIdentifier: "completedSegue", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "completedSegue"){
            let vc2=segue.destination as! ThirdViewController
            vc2.getComp=textArray[i]
            textArray.remove(at: i)
        }
    }
   
    
    
    
    @IBOutlet weak var table: UITableView!
    
  
    var text: String = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        
        return textArray.count
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        
        cell.textLabel?.text = textArray[indexPath.row]

      UserDefaults.standard.set(textArray, forKey: "key")
    
        //print( UserDefaults.standard.value(forKey: "key")!)
        return cell
    }
    
  
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let completed = UIContextualAction(style: .normal, title: "Completed") { (action, view, nil) in
           // print("completed")
            self.performSegue(withIdentifier: "completedSegue", sender:self)
           
            print(indexPath.row)
            self.table.reloadData()
            i=indexPath.row
            print("i=\(i)")
        }
        return UISwipeActionsConfiguration(actions: [completed])
        
    }
  

    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, nil) in
           // print("Delete swiped")
        textArray.remove(at: indexPath.row)
            self.table.reloadData()
            print(textArray)
        
            
            
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  UserDefaults.standard.removeObject(forKey: "key")
       // if(textArray.isEmpty == false){
            textArray=UserDefaults.standard.value(forKey: "key") as! [String]
            // }
        
        if text != ""{
            textArray.insert(text, at: 0)

        }
        
    }


}

