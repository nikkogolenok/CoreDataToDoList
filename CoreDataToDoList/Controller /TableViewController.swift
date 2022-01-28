//
//  TableViewController.swift
//  CoreDataToDoList
//
//  Created by Никита Коголенок on 28.01.22.
//

import UIKit

class TableViewController: UITableViewController {
    
    // MARK: - Variable
    var toDoList: [String] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
    }
    
    // MARK: - Action
    @IBAction func addTasks(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Add task", message: "Add new task", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            if let textField = alertController.textFields?[0] {
                self.toDoList.insert(textField.text ?? "Default", at: 0)
                self.tableView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        alertController.addTextField { _ in }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
