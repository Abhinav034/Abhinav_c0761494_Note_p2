//
//  NotesViewController.swift
//  Abhinav_c0761494_Note_p1
//
//  Created by Abhinav Bhardwaj on 2019-11-11.
//  Copyright © 2019 Abhinav Bhardwaj. All rights reserved.
//

import UIKit


class NotesViewController: UIViewController , UITableViewDataSource ,UITableViewDelegate , canRecieve {
    func sendData(data: String) {
    notes.append(data)
        NotesTableView.reloadData()
    }
    
   
   
    
    
    
    var notes:[String] = []
    
    
    var name:String?
    @IBOutlet weak var TrashButton: UIButton!
    
    
    @IBOutlet weak var FolderButton: UIButton!
    @IBOutlet weak var NotesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TrashButton.isEnabled = false
        FolderButton.isEnabled = false
       
        
    
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
       }

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell:UITableViewCell = (self.NotesTableView.dequeueReusableCell(withIdentifier: "NotesCell") as UITableViewCell?)!
        
       
        cell.textLabel?.text = notes[indexPath.row]
        
       
        return cell
       }

    @IBAction func EllipseButton(_ sender: UIButton) {
        
        
        if TrashButton.isEnabled == false && FolderButton.isEnabled == false{
        TrashButton.isEnabled = true
        FolderButton.isEnabled = true
        }
        else if TrashButton.isEnabled == true && FolderButton.isEnabled == true{
            TrashButton.isEnabled = false
            FolderButton.isEnabled = false
            

        }
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let userData = segue.destination as! TextViewController
        userData.delegate = self
        
        
    }
    
    
    
    
    
}

