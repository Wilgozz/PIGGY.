//
//  GraficoViewController.swift
//  PIGGY
//
//  Created by Kamylle Wilgozz on 19/05/2022.
//  Copyright © 2022 Kamylle Wilgozz. All rights reserved.
//

import Foundation
import UIKit
import Charts

class GraficoViewController: UIViewController, ChartViewDelegate{
    
    lazy var grafico: PieChartView = {
        let chartView = PieChartView()
        chartView.translatesAutoresizingMaskIntoConstraints = false
        return chartView
        
    }()
    
    
    @IBOutlet weak var navBar: UIView!
    
    override func viewDidLoad() {
        navBar.bordaRedonda(radius: 16, cantos: [.superiorDireito, .superiorEsquerdo])
        
        view.addSubview(grafico)
        grafico.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
        grafico.bottomAnchor.constraint(equalTo: navBar.topAnchor, constant: -16).isActive = true
        grafico.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        grafico.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        getDadosBanco()
        setData()
        grafico.legend.enabled = false
    }

    var valorPet = 0.0
    var valorCompras = 0.0
    var valorRestaurante = 0.0
    var valorEstudo = 0.0
    var valorVA = 0.0
    var valorSalario = 0.0
    var valorFreelance = 0.0
    
    func getDadosBanco() {
        for dado in DataModel().dados{
            if dado.entradaSaida == "saída" {
                
                if dado.categoria == "pet" {
                    valorPet += -dado.valor
                }
                
                if dado.categoria == "compras" {
                    valorCompras += -dado.valor
                }
                
                if dado.categoria == "estudo" {
                    valorEstudo += -dado.valor
                }
                
                if dado.categoria == "restaurante" {
                    valorRestaurante += -dado.valor
                }
                
                if dado.categoria == "vale alimentação" {
                    valorVA += -dado.valor
                }
                
                if dado.categoria == "salário" {
                    valorSalario += -dado.valor
                }
                
                if dado.categoria == "freelance" {
                    valorFreelance += -dado.valor
                }
                
                
            }
        }
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    var colors: [UIColor] = [
        UIColor(red: 0.84, green: 0.64, blue: 0.87, alpha: 1.00),
        UIColor(red: 0.67, green: 0.49, blue: 0.71, alpha: 1.00),
        UIColor(red: 0.52, green: 0.34, blue: 0.55, alpha: 1.00),
        UIColor(red: 0.38, green: 0.20, blue: 0.41, alpha: 1.00),
        UIColor(red: 0.24, green: 0.07, blue: 0.27, alpha: 1.00),
        UIColor(red: 0.82, green: 0.40, blue: 0.65, alpha: 1.00),
        UIColor(red: 0.76, green: 0.44, blue: 0.82, alpha: 1.00)
    ]
    
    func setData (){
        let set1 = PieChartDataSet(values: getValores(), label: "teste")
        set1.colors = colors
        
        let data = PieChartData(dataSet: set1)
        
        let pFormatter = NumberFormatter()
        pFormatter.positivePrefix = "R$ "
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        
        grafico.data = data
    }
    
    func getValores() -> [PieChartDataEntry] {
        var valores: [PieChartDataEntry] = []
        if valorPet > 0 {
            valores.append(PieChartDataEntry(value: valorPet, label: "Pet"))
        }
        if valorCompras > 0 {
            valores.append(PieChartDataEntry(value: valorCompras, label: "Compras"))
        }
        if valorEstudo > 0 {
            valores.append(PieChartDataEntry(value: valorEstudo, label: "Estudo"))
        }
        if valorRestaurante > 0 {
            valores.append(PieChartDataEntry(value: valorRestaurante, label: "Restaurante"))
        }
        if valorVA > 0 {
            valores.append(PieChartDataEntry(value: valorVA, label: "Vale Alimentação"))
        }
        if valorSalario > 0 {
            valores.append(PieChartDataEntry(value: valorSalario, label: "Salário"))
        }
        if valorFreelance > 0 {
            valores.append(PieChartDataEntry(value: valorFreelance, label: "Freelance"))
        }
        
        
        return valores
    }
    
}
