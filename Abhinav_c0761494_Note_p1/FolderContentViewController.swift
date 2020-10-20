//
//  FolderContentViewController.swift
//  UserDefaults
//
//  Created by Abhinav Bhardwaj on 2020-10-18.
//  Copyright © 2020 Abhinav Bhardwaj. All rights reserved.
//

import UIKit

class FolderContentViewController: UITableViewController {
    
    var contentsArr = [String]()
    var keyname = ""
    
    let defaults = UserDefaults.standard
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contentsArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = contentsArr[indexPath.row]
       

        return cell
    }
    

    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
       
        return true
    }
    


   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contentsArr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


    @IBAction func addButtonPressed(_ sender: UIButton) {
        
        alert()
        
        
    }
    
    func alert(){
        let alert = UIAlertController(title: "Add Notes", message: "Enter note title", preferredStyle: .alert)
            
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak alert] (_) in
            
            let title = alert?.textFields![0].text
            
            if (!self.contentsArr.contains(title!)){
                self.contentsArr.append(title!)
            }
            
            self.tableView.reloadData()
            
        }))
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { [weak alert] (_) in
            
            
            alert?.dismiss(animated: true, completion: nil)
            
        }))
        
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        defaults.set(contentsArr, forKey: keyname)
    }
    override func viewWillAppear(_ animated: Bool) {
     
        let defaultsArr = defaults.array(forKey: keyname)
        if (defaultsArr != nil){
            contentsArr = defaultsArr as! [String]
        }
        
        
       
    }
    

}
