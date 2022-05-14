//
//  CadastroViewController.swift
//  PIGGY
//
//  Created by Kamylle Wilgozz on 14/05/2022.
//  Copyright © 2022 Kamylle Wilgozz. All rights reserved.
//

import Foundation
import UIKit

class CadastroViewController: UIViewController {
    
    
    @IBOutlet weak var campoDeCategoria: UITextField!
    let categorias = ["compras", "pet", "restaurante", "estudo", "vale alimentação", "salário", "freelance"]
    
    @IBOutlet weak var campoEntradaSaida: UITextField!
    let entradaSaida = ["entrada", "saída"]
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        campoDeCategoria.inputView = pickerView
        
    }
    
    
}

extension CadastroViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return categorias.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categorias[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        campoDeCategoria.text = categorias[row]
        campoDeCategoria.resignFirstResponder()
    }
}
