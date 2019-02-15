//
//  ThirdViewController.swift
//  ToDoList
//
//  Created by IMCS2 on 2/15/19.
//  Copyright © 2019 com.phani. All rights reserved.
//

import UIKit


class ThirdViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   // var rows:Int = 0
    var getComp=""
    var compArray=[String]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getComp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath1: IndexPath) -> UITableViewCell {
       // print("third VC")
        print(getComp)
        compArray.insert(getComp, at: 0)
        let cell=tableView.dequeueReusableCell(withIdentifier: "cellComp", for: indexPath1) as UITableViewCell
        
        
        cell.textLabel?.text = compArray[indexPath1.row]
         UserDefaults.standard.set(compArray, forKey: "keycom")
        
     
        return cell
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        compArray=UserDefaults.standard.value(forKey: "keycom") as! [String]
        
        
      //  if getComp != ""{
            compArray.insert(getComp, at: 0)


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
