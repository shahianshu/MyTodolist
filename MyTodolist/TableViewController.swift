//
//  ViewController.swift
//  MyTodolist
//
//  Created by Anshu Shahi on 02/08/18.
//  Copyright © 2018 Shahi. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var myArray = [item]()

    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask ).first?.appendingPathComponent("items.plist")
    
    

    @IBAction func addButtonPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add to Todolist", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            
        }
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            
            let temp = item()
            temp.title = (alert.textFields?.first?.text!)!
            self.myArray.append(temp)
            self.save()
           
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil ))
        present(alert, animated: true , completion: nil )
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(dataFilePath!)
//        if let items = defaults.value(forKey: "MyToDoListArray")  as? [item] {
//            myArray = items
//        }

        
        loadItems()
        configureTableView()
        
        
    }
  
    ////////////////////////////////////
    
    //Mark:-  tableviewDelegate methods
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        myArray[indexPath.row].done = myArray[indexPath.row].done ? false : true
        save()
        
        
    }
    
    ////////////////////////////////////
    //Mark:-  tableviewDatasource methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableCell", for: indexPath)
        
        
        if myArray.count >= 0 {
            cell.textLabel?.text = myArray[indexPath.row].title
            cell.accessoryType = myArray[indexPath.row].done ? .checkmark : .none
        }
        
        return cell
    }
    
    
    
    func configureTableView() {
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
    }
    
    //Mark :- data saving into plist
    
    func save () {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(myArray)
            try data.write(to: dataFilePath! )
        }
        catch {
            print(error)
        }
        
        tableView.reloadData()
    }
    
    
    //Mark :- Decoding of data
    func loadItems() {
        if let data = try? Data(contentsOf: dataFilePath! ) {
            // can contain nil that is why try is used
            
            let decoder = PropertyListDecoder()
            do {
               myArray = try decoder.decode( [item].self , from: data )
            }
            catch {
                print(error)
            }
        }
        
    }

}

