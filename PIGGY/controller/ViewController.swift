//
//  ViewController.swift
//  PIGGY
//
//  Created by Kamylle Wilgozz on 14/05/2022.
//  Copyright © 2022 Kamylle Wilgozz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func BotaoEntrar(_ sender: Any) {
        
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "TelaTesteViewController") {
            present(destinationVC, animated: true, completion: nil)
        }
        
    }

}

