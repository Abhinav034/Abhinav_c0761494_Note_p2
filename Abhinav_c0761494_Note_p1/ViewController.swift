//
//  ViewController.swift
//  midtermtest_final
//
//  Created by Abhinav Bhardwaj on 2019-11-08.
//  Copyright © 2019 Abhinav Bhardwaj. All rights reserved.
//

import UIKit
var FolderNames:[String] = []
var curIndex = 0
class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
   
    
    @IBOutlet weak var editButton: UIButton!
    
    
    @IBOutlet weak var StoryTableView: UITableView!
    
    
    @IBOutlet weak var folderLabel: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        folderLabel.text = "Folders"
        
    }
    
    
    
    @IBAction func editButtonPressed(_ sender: UIButton) {
        
        let title = editButton.titleLabel?.text
               
              if title == "Edit"{
                         editButton.setTitle("Done", for: .normal)
                     StoryTableView.isEditing = !StoryTableView.isEditing
                     
                     }
                     
                  else if title == "Done"{
                         
                        StoryTableView.isEditing = !StoryTableView.isEditing
                        editButton.setTitle("Edit", for: .normal)
                     }
               
        
        
        
        
        
        
    }
    
    
    

    
    @IBAction func newFolderPressed(_ sender: UIButton) {
        
        alert()
        
    }
    

    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return FolderNames.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (self.StoryTableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell?)!

        
         cell.textLabel?.text = FolderNames[indexPath.row]
        
        cell.imageView?.image = UIImage(named: "folder-icon")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            FolderNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)

        }


        
    }
    func alert(){
        
        
        let alert = UIAlertController(title: "New Folder", message: "Enter a name for this folder", preferredStyle: .alert)

                      
                      alert.addTextField { (textField) in
                          textField.text = ""
                      }
                   
               

                      alert.addAction(UIAlertAction(title: "Add Item", style: .default, handler: { [weak alert] (_) in
                       
                       let textField = alert?.textFields![0]
                       
                        
                        
                       
                        FolderNames.append(textField!.text!)
                        self.StoryTableView.reloadData()
                       
                       
                          
                      }))
               alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { [weak alert] (_) in
                   
                   
                  alert?.dismiss(animated: true, completion: nil)
                   
                   
               }))

                      
                      self.present(alert, animated: true, completion: nil)
              
        
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        
        
        return true
        
    }
    
   func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {


    let item = FolderNames[sourceIndexPath.row]
    FolderNames.remove(at: sourceIndexPath.row)
    FolderNames.insert(item, at: destinationIndexPath.row)


    }
    
    
    
    
}



