//
//  ViewController.swift
//  Grocery List
//
//  Created by Henry Juffernbruch on 2/22/18.
//  Copyright © 2018 Henry Juffernbruch. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var groceryListTableList: UITableView!
    var groceries: Array <String>?

    override func viewDidLoad() {
        super.viewDidLoad()
      //  groceries = Array<String>()
        loadGroceries()
    }
    func saveGroceries() {
        let defaults = UserDefaults.standard
         defaults.set(groceries, forKey: "groceries")
    }
    func loadGroceries() {
        let defaults = UserDefaults.standard
        groceries = defaults.array(forKey: "groceries") as? Array <String> ?? []
    }
        

    @IBAction func addUnwindSegue(sender:UIStoryboardSegue) {
        let viewController = sender.source as? Add_Grocery_ViewController
        groceries?.append(viewController?.getGroceries() ?? "")
        groceryListTableList.reloadData()
        saveGroceries()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(groceries?.count)!
        }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellID")
        tableViewCell?.textLabel?.text = groceries?[indexPath.row]
        return tableViewCell!
    }
    // deletes items
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groceries?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveGroceries()
        }
    }
    
    
    
    
}
