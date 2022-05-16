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
    
    
    override func viewDidLoad() {
        navBar.bordaRedonda(radius: 16, cantos: [.superiorDireito, .superiorEsquerdo])
        fundoHome.bordaRedonda(radius: 16, cantos: [.superiorDireito, .superiorEsquerdo])
        collectionview.dataSource = self
    }
    
    let itens: [Item] = [
        Item(categoria: "pet", descricao: "coleira pra jorge", valor: 45),
        Item(categoria: "compras", descricao: "tinta", valor: 25),
        Item(categoria: "pet", descricao: "racao", valor: 33),
        Item(categoria: "salário", descricao: "proventos", valor: 445),

    
    ]
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
