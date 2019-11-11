//
//  TextViewController.swift
//  Abhinav_c0761494_Note_p1
//
//  Created by Abhinav Bhardwaj on 2019-11-11.
//  Copyright © 2019 Abhinav Bhardwaj. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    @IBOutlet weak var UserText: UITextView!
    
    
    var text:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UserText.text = ""
        
    }
    

    func getText() ->String{
    
        text = UserText.text
        
        print(text!)
    
    return text!
    
    }

    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        
    }
    

}
