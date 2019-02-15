//
//  SecondViewController.swift
//  ToDoList
//
//  Created by IMCS2 on 2/14/19.
//  Copyright © 2019 com.phani. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var list : String = ""
    @IBOutlet weak var listText: UITextField!
    
  
    @IBAction func addButton(_ sender: UIButton) {
        //list=listText.text!
        
        performSegue(withIdentifier: "addItem", sender: self)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc=segue.destination as! ViewController
        vc.text=listText.text!
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
