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
        let cell=tableView.dequeueReusableCell(withIdentifier: "cellComp", for: indexPath1) as UITableViewCell
        cell.textLabel?.text = compArray[indexPath1.row]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    // UserDefaults.standard.removeObject(forKey: "keykey")
        
      if(UserDefaults.standard.value(forKey: "keykey") != nil)
      {
        compArray=UserDefaults.standard.value(forKey: "keykey") as! [String]
        if compArray.isEmpty == false
        {
        print("Third VC \(compArray)")
        }
      }
        print(compArray)
        
}
}
