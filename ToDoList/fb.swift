//
//  fb.swift
//  ToDoList
//
//  Created by IMCS2 on 2/20/19.
//  Copyright © 2019 com.phani. All rights reserved.
//

import Foundation
//
//  firebase.swift
//  ToDoList
//
//  Created by IMCS2 on 2/19/19.
//  Copyright © 2019 com.phani. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

var ref1: DatabaseReference!
var ref: DatabaseReference!
var item = [String]()
var fetch : String = ""
var namedataArr = [String]()

//func fetchDataFromFirebase(fetch : String) -> [String]{
//    ref = Database.database().reference().child(fetch)
//    ref.observe(.value) { (snapshot: DataSnapshot) in
//        for nameValue in snapshot.children{
//            let snapshotContent = nameValue as? DataSnapshot
//            let namedata = snapshotContent?.value as? [String]
//            print(namedata!)
//            namedataArr = namedata!
//            //return namedata as! [String]
//
//        }}
//    return namedataArr
//
//}

func fetchData() -> [String] {
    
    let  ref = Database.database().reference()
    ref.child("complist/complist").observeSingleEvent(of: .value) { (snapshot) in
        namedataArr = snapshot.value as! AnyObject as! [String]
        print("from fetch \(namedataArr)")
        
        
    }
    return namedataArr
    
}


func writeToFirebase( item : [String], key : String){
    
    ref = Database.database().reference().child(key)
    ref.child(key).setValue(item)
    
}



//func fetchDataFromFirebase1(fetch : String) -> [String]{
//    ref1 = Database.database().reference().child(fetch)
//    ref1.observe(.value) { (snapshot: DataSnapshot) in
//        for nameValue in snapshot.children{
//            let snapshotContent = nameValue as? DataSnapshot
//            let namedata = snapshotContent?.value as? [String]
//            print(namedata!)
//            namedataArr = namedata!
//            //return namedata as! [String]
//
//            print(ref1); print("ref1")
//        }}
//    return namedataArr
//
//}
//
//func writeToFirebase1( item : [String], list : String){
//
//    ref1 = Database.database().reference().child(list)
//    ref1.child(list).setValue(item)
//
//}
