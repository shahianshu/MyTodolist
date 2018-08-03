//
//  ViewController.swift
//  MyTodolist
//
//  Created by Anshu Shahi on 02/08/18.
//  Copyright © 2018 Shahi. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    //creating array for storing table view contents
//    var myArray = [String]()
    var myArray = ["hello" , "kaise ho" , "kya kya kahte ho"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        
    }
  
    ////////////////////////////////////
    
    //Mark:-  tableviewDelegate methods
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType ==  .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType =  .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    ////////////////////////////////////
    //Mark:-  tableviewDatasource methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableCell", for: indexPath
        )
       
        if myArray.count >= 0 {
            cell.textLabel?.text = myArray[indexPath.row]
        }
        
        return cell
    }
    
    
    
    func configureTableView() {
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
    }

}

