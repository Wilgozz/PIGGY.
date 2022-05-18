//
//  DataModel.swift
//  PIGGY
//
//  Created by Kamylle Wilgozz on 17/05/2022.
//  Copyright © 2022 Kamylle Wilgozz. All rights reserved.
//

import Foundation
class DataModel{
    private static var sharedDataModel = DataModel()
    let infos:[Item] = []
    var saldo:Double {
        get {
            var soma = 0.0
            for dado in dados{
                soma = soma + dado.valor
            }
            return soma
        }
    }
    var dados:[InfoEntry]{
        get{
            return sqlite.getInfoEntry()
        }
    }
    var sqlite = SQLiteDatabase()
    
//    private init(){
//        
//    }
    func insertDados(informacoes:InfoEntry){
        _ = sqlite.insertInfoEntry(infoEntry: informacoes)
    }
    class func shared() -> DataModel{
        return sharedDataModel
    }
}
