//
//  TextViewController.swift
//  Abhinav_c0761494_Note_p1
//
//  Created by Abhinav Bhardwaj on 2019-11-11.
//  Copyright © 2019 Abhinav Bhardwaj. All rights reserved.
//

import UIKit

protocol canRecieve {
    func sendData(data: String)
}



class TextViewController: UIViewController {

    @IBOutlet weak var UserText: UITextView!
    
    var delegate: canRecieve?
    var text:String?
    var text2:String?
    var arrayText:[String] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UserText.text = ""
        UserText.becomeFirstResponder()
        
        
    }
    func getText(){
       
           text = UserText.text
           
//           print(text!)
       
           arrayText.append(text!)
       
       }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        getText()
        text2 = text
        delegate?.sendData(data: text2!)
        dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
       
    }
    
    
    

}
