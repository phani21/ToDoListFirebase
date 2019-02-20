//
//  ThirdViewController.swift
//  ToDoList
//
//  Created by IMCS2 on 2/15/19.
//  Copyright © 2019 com.phani. All rights reserved.
//
import FirebaseDatabase
import UIKit


class ThirdViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
  
    @IBOutlet weak var completedtable: UITableView!
    var getComp=""
    var compArray=[String]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let  ref = Database.database().reference()
//        ref.child("complist/complist").observeSingleEvent(of: .value) { (snapshot) in
//            self.compArray = snapshot.value as AnyObject as! [String]
//        }
          print("Completed Array Count = \(completedArray.count)")
      //reloadInputViews()
        return completedArray.count
      
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath1: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cellComp", for: indexPath1) as UITableViewCell
        cell.textLabel?.text = completedArray[indexPath1.row]
        print("completedArray[Indexpath1.row]"); print(completedArray[indexPath1.row])
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("inside ThirdViewCOntroller.ViewDidLoad()")
    // UserDefaults.standard.removeObject(forKey: "keykey")
        
//      if(UserDefaults.standard.value(forKey: "keykey") != nil)
//      {
//        compArray=UserDefaults.standard.value(forKey: "keykey") as! [String]
//        if compArray.isEmpty == false
//        {
        print("Third VC \(completedArray)")
//        }
//      }
        
        let  ref4 = Database.database().reference()
        ref4.child("complist/complist").observe(.value) { (snapshot) in
            completedArray = snapshot.value as AnyObject as! [String]
      
            print("ViewDIDLOAD COMPLETED ARRAY"); print(completedArray)
            self.completedtable.reloadData()
        }
}
}
