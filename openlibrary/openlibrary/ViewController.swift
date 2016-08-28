//
//  ViewController.swift
//  openlibrary
//
//  Created by Erick Rodriguez Ramos on 28/08/16.
//  Copyright © 2016 Erick Rodriguez Ramos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var isbn: UITextField!
    @IBOutlet weak var salida: UITextView!
    
    @IBAction func pedir(sender: AnyObject) {
        let urls="https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"+isbn.text!
        let url = NSURL(string: urls)
        let datos:NSData?=NSData(contentsOfURL: url!)
                  let texto = NSString(data:datos!,encoding: NSUTF8StringEncoding)
                self.salida.text=texto! as String
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.isbn.delegate = self;
        // Do any additional setup after loading the view, typically from a nib.
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }


}

