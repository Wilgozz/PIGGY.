//
//  ItemCollectionViewCell.swift
//  PIGGY
//
//  Created by Kamylle Wilgozz on 16/05/2022.
//  Copyright © 2022 Kamylle Wilgozz. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagem: UIImageView!
    
    @IBOutlet weak var descricao: UILabel!
    
    @IBOutlet weak var categoria: UILabel!

    
    @IBOutlet weak var valor: UILabel!
    
    
    func setup(item: Item){
        descricao.text = item.descricao
        categoria.text = item.categoria
        valor.text = "R$ \(item.valor)"
        
        
        if item.categoria == "compras"{
            imagem.image = UIImage(named: "cesta")
        }
        
        if item.categoria == "pet"{
            imagem.image = UIImage(named: "passaro")
        }
        
        if item.categoria == "restaurante"{
            imagem.image = UIImage(named: "batata")
        }
        
        if item.categoria == "estudo"{
            imagem.image = UIImage(named: "livro")
        }
        
        if item.categoria == "vale alimentação"{
            imagem.image = UIImage(named: "refeicao")
        }
        
        if item.categoria == "salário"{
            imagem.image = UIImage(named: "moeda")
        }
        
        if item.categoria == "freelance"{
            imagem.image = UIImage(named: "pc")
        }
        
    }
}
