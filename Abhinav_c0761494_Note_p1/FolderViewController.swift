//
//  FolderViewController.swift
//  UserDefaults
//
//  Created by Abhinav Bhardwaj on 2020-10-18.
//  Copyright © 2020 Abhinav Bhardwaj. All rights reserved.
//

import UIKit

class FolderViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    var folderNames = [String]()
    let defaults = UserDefaults.standard
    let contents = [String]()
    @IBOutlet weak var tableVC: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        let data = defaults.array(forKey: "keys")
        if ((data) != nil){
            folderNames = data as! [String]
            tableVC.reloadData()
        }
      
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return folderNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableVC.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = folderNames[indexPath.row]
        cell.detailTextLabel?.text = getContents(index: indexPath.row)
       
        
        return cell
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let destVC = storyboard?.instantiateViewController(withIdentifier: "contentVC") as! FolderContentViewController
        destVC.keyname = folderNames[indexPath.row]
        navigationController?.pushViewController(destVC, animated: true)
        
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            folderNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }

    @IBAction func addButtonPressed(_ sender: UIButton) {
        
        alert()
        
        
    }
    
    
    func alert(){
        let alert = UIAlertController(title: "Add Folder", message: "Enter Folder Name", preferredStyle: .alert)
            
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak alert] (_) in
            
            let folderName = alert?.textFields![0].text
            
            if (!self.folderNames.contains(folderName!)){
                self.folderNames.append(folderName!)
            }
            
            self.tableVC.reloadData()
            
        }))
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { [weak alert] (_) in
            
            
            alert?.dismiss(animated: true, completion: nil)
            
        }))
        
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        defaults.set(folderNames, forKey: "keys")
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tableVC.reloadData()
    }
    
    
    func getContents(index : Int) -> String{
        
        let contents = defaults.array(forKey: folderNames[index])
        if ((contents) != nil){
            return String(contents!.count)
        }
        return ""
    }
    
  
}
