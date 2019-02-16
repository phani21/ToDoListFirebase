//
//  ThirdViewController.swift
//  ToDoList
//
//  Created by IMCS2 on 2/15/19.
//  Copyright © 2019 com.phani. All rights reserved.
//

import UIKit


class ThirdViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
  
    var getComp=""
    var compArray=[String]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return compArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath1: IndexPath) -> UITableViewCell {
      
       
        if flag==true{
    
            print("Get comp \(getComp)")
           
        };
        let cell=tableView.dequeueReusableCell(withIdentifier: "cellComp", for: indexPath1) as UITableViewCell
        
        
        cell.textLabel?.text = compArray[indexPath1.row]
         UserDefaults.standard.set(compArray, forKey: "keycom")
        
          flag = false
        return cell
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var k = false
    // UserDefaults.standard.removeObject(forKey: "keycom")
      if(UserDefaults.standard.value(forKey: "keycom") != nil){
        k = true
         compArray=UserDefaults.standard.value(forKey: "keycom") as! [String]
        }

        print(compArray)
       if getComp != "" {
       
            compArray.insert(getComp, at: 0)

        }
        
    


}
