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
    
    
    @IBOutlet weak var campoDescricao: UITextField!
    
    
    
    @IBOutlet weak var campoValor: UITextField!
    
    
    
    
    var pickerView = UIPickerView()
    var pickerViewEntradaSaida = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerViewEntradaSaida.delegate = self
        pickerViewEntradaSaida.dataSource = self
    
        
        campoDeCategoria.inputView = pickerView
        campoEntradaSaida.inputView = pickerViewEntradaSaida
        
    }
    
    @IBAction func botaoTelaCadastro(_ sender: Any) {
        if let valor = campoValor.text, let descricao = campoDescricao.text, let categoria = campoDeCategoria.text, let entradaESaida = campoEntradaSaida.text {
            
            if valor.count <= 0 || descricao.count <= 0 || categoria.count <= 0 || entradaESaida.count <= 0{
                let alert = UIAlertController(title: "Erro", message: "todos os campos devem estar preenchidos!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel))
                present(alert, animated: true)
                return
            }
            
            //essas variaveis devem ser salvas no sqlite
            print(valor)
            print(descricao)
            print(categoria)
            print(entradaESaida)
            
            let valorDouble = Double(valor)
            if var valorArrumado = valorDouble{
                if entradaESaida == "saída" {
                    valorArrumado = -valorArrumado
                }
                DataModel().insertDados(informacoes: InfoEntry(categoria: categoria, entradaSaida: entradaESaida, descricao: descricao, valor: valorArrumado))
            }else{
                let alert = UIAlertController(title: "Erro", message: "não foi possível cadastrar! verifique os campos que foram preenchidos", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel))
                present(alert, animated: true)
            }
        }
    }
}

extension CadastroViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if pickerView == pickerViewEntradaSaida {
            return entradaSaida.count
        }
        
        return categorias.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerViewEntradaSaida{
            return entradaSaida[row]
        }
        return categorias[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerViewEntradaSaida{
            campoEntradaSaida.text = entradaSaida[row]
            campoEntradaSaida.resignFirstResponder()
        }else{
            campoDeCategoria.text = categorias[row]
            campoDeCategoria.resignFirstResponder()
        }
    }
}
