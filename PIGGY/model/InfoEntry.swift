//
//  InfoEntry.swift
//  PIGGY
//
//  Created by Kamylle Wilgozz on 17/05/2022.
//  Copyright © 2022 Kamylle Wilgozz. All rights reserved.
//

import Foundation

class InfoEntry{
    internal init(categoria: String, entradaSaida: String, descricao: String, valor: Double) {
        self.categoria = categoria
        self.entradaSaida = entradaSaida
        self.descricao = descricao
        self.valor = valor
    }
    var categoria:String
    var entradaSaida:String
    var descricao:String
    var valor:Double
}
