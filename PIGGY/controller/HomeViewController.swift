//
//  HomeViewController.swift
//  PIGGY
//
//  Created by Kamylle Wilgozz on 14/05/2022.
//  Copyright © 2022 Kamylle Wilgozz. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var navBar: UIView!
    
    
    @IBOutlet weak var fundoHome: UIView!
    
    override func viewDidLoad() {
        navBar.bordaRedonda(radius: 16, cantos: [.superiorDireito, .superiorEsquerdo])
        fundoHome.bordaRedonda(radius: 16, cantos: [.superiorDireito, .superiorEsquerdo])
    }
}
