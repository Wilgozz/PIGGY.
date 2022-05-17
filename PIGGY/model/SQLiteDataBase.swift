//
//  SQLiteDataBase.swift
//  PIGGY
//
//  Created by Kamylle Wilgozz on 17/05/2022.
//  Copyright © 2022 Kamylle Wilgozz. All rights reserved.
//

import Foundation
import SQLite

class SQLiteDatabase{
    var db:Connection?
    
    let table = Table("dados")
    
    let id = Expression<Int64>("id")
    let categoria = Expression<String>("categoria")
    let entradaSaida = Expression<String>("entradaSaida")
    let descricao = Expression<String>("descricao")
    let valor = Expression<Double>("valor")
    
    init(){
        do{
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            db = try Connection("\(path)/dados.sqlite3")
            try db?.run(table.create(ifNotExists: true){
                t in
                t.column(id,primaryKey: .autoincrement)
                t.column(categoria)
                t.column(entradaSaida)
                t.column(descricao)
                t.column(valor)
            })
        }catch{
            print(error)
        }
    }
    func insertInfoEntry (infoEntry:InfoEntry) -> Bool{
        guard let db = db else{
            return false
        }
        do{
            let rowId = try db.run(table.insert(
                categoria <- infoEntry.categoria,
                entradaSaida <- infoEntry.entradaSaida,
                descricao <- infoEntry.descricao,
                valor <- infoEntry.valor
            ))
            if rowId > 0{
                return true
            }
        }catch{
            print(error)
        }
        return false
    }
    func getInfoEntry() -> [InfoEntry]{
        var infos = [InfoEntry]()
        if let db = db{
            do{
                for row in try db.prepare(table.select(categoria, entradaSaida, descricao, valor)){
                    infos.append(InfoEntry(categoria: row[categoria], entradaSaida: row[entradaSaida], descricao: row[descricao], valor: row[valor]))
                }
            }catch{
                print(error)
            }
        }
        return infos
    }
}
