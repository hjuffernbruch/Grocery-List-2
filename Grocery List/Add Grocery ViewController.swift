//
//  Add Grocery ViewController.swift
//  Grocery List
//
//  Created by Henry Juffernbruch on 2/22/18.
//  Copyright © 2018 Henry Juffernbruch. All rights reserved.
//

import UIKit

class Add_Grocery_ViewController: UIViewController {

    @IBOutlet weak var addGroceryItemTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    func getGroceries() -> String {
        return addGroceryItemTextField.text!
    
    
    
    }
    

    


}
