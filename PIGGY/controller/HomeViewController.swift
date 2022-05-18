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
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    @IBOutlet weak var saldoLabel: UILabel!
    
    override func viewDidLoad() {
        navBar.bordaRedonda(radius: 16, cantos: [.superiorDireito, .superiorEsquerdo])
        fundoHome.bordaRedonda(radius: 16, cantos: [.superiorDireito, .superiorEsquerdo])
        collectionview.dataSource = self
        let dados = DataModel().dados
        for dado in dados{
            let item = Item(categoria: dado.categoria, descricao: dado.descricao, valor: dado.valor)
            itens.append(item)
        }
        
        let saldo = DataModel().saldo
        let saldoReduzidoCasa: String = String(format: "%.2f", saldo)
        saldoLabel.text = "R$ \(saldoReduzidoCasa)"
        
    }
    
    var itens: [Item] = []
}

extension HomeViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        
        cell.setup(item: itens[indexPath.row])
        return cell
    }
}
